<?php

namespace App\Controller;

use App\Entity\OrderLine;
use App\Entity\Orders;
use App\Repository\CategoryRepository;
use App\Repository\OrderLineRepository;
use App\Repository\OrdersRepository;
use App\Repository\ProductRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Validator\Constraints\Date;
use Symfony\Component\Validator\Constraints\DateTime;

#[Route('/shopping-cart')]
class ShoppingCartController extends AbstractController
{
    private $requestStack;
    private $security;
    private $usrrepo;

    public function __construct(RequestStack $requestStack, Security $security, UserRepository $userRepository)
    {
        $this->requestStack = $requestStack;
        $this->security = $security;
        $this->usrrepo = $userRepository;
    }

    #[Route('/', name: 'shopping_cart_index', methods: ['GET'])]
    public function index(ProductRepository $productRepository): Response
    {

        $session = $this->requestStack->getSession();
        $cart = $session->get('cart', []);

        $products = [];

        foreach ($cart as $id=>$quantity){
            $prod = $productRepository->find($id);
            array_push($products, ['product' => $prod, 'quantity' => $quantity, 'total' => $quantity*$prod->getPrice()]);
        }

        $res = 0;

        for($i= 0;  $i < count($products); $i++){
        //foreach ($products['total'] as $totalPrice){
            $res += $products[$i]['total'];
        }

        return $this->render('shopping_cart/index.html.twig', [
            'controller_name' => 'ShoppingCartController',
            'products' => $products,
            'totalPrice' => $res
        ]);
    }

    #[Route('/{id}', name: 'shopping_cart_delete', methods: ['GET', 'POST'])]
    public function delete(int $id): Response
    {
        $session = $this->requestStack->getSession();
        $cart = $session->get('cart', []);
        if($cart[$id] > 1){
            $cart[$id]--;
        }else{
            unset($cart[$id]);
        }
        $session->set('cart', $cart);
        return $this->redirectToRoute('shopping_cart_index', [], Response::HTTP_SEE_OTHER);
    }

    #[Route('/totalProd', name: 'total_prod', methods: ['GET'])]
    public function getTotalProd(ProductRepository $productRepository)
    {
        $session = $this->requestStack->getSession();
        $cart = $session->get('cart', []);

        $products = [];

        foreach ($cart as $id=>$quantity){
            $prod = $productRepository->find($id);
            array_push($products, ['product' => $prod, 'quantity' => $quantity, 'total' => $quantity*$prod->getPrice()]);
        }

        return new Response(
            count($products),
            Response::HTTP_OK
        );
    }

    #[Route('/cartvalid', name: 'cart_valid', methods: ['GET', 'POST'])]
    public function validateCart(OrdersRepository $ordersRepository, ProductRepository $productRepository, EntityManagerInterface $entityManager, OrderLineRepository $orderLineRepository)
    {


        $session = $this->requestStack->getSession();
        $cart = $session->get('cart', []);

        $products = [];
        $ordrLine = [];
$usr = $this->usrrepo->find($this->security->getUser());
        $orders = new Orders();
        $orders->setUser($usr);
        $orders->setAddress($usr->getAddress());
        $orders->setDate(new \DateTime('now'));
        foreach ($cart as $id=>$quantity){


            $orderLine = new OrderLine();
            $prod = $productRepository->find($id);
            array_push($products, ['product' => $prod, 'quantity' => $quantity, 'total' => $quantity*$prod->getPrice()]);
            $orderLine->setProduct($prod);
            $orderLine->setPrice($quantity*$prod->getPrice());
            $orderLine->setQuantity($quantity);
            $orderLine->setOrders($orders);
            $entityManager->persist($orderLine);
        }


        $entityManager->persist($orders);
        $entityManager->flush();
       // $orders->setUser($this->security->getUser());
        //$orders->set

        return $this->redirectToRoute('shopping_cart_index');
    }

}
