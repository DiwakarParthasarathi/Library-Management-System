<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['login'])==0)
    {   
header('location:index.php');
}
else{ 
if(isset($_GET['del']))
{
$id=$_GET['del'];
$sql = "delete from tblbooks  WHERE id=:id";
$query = $dbh->prepare($sql);
$query -> bindParam(':id',$id, PDO::PARAM_STR);
$query -> execute();
$_SESSION['delmsg']="Category deleted scuccessfully ";
header('location:manage-books.php');

}


    ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Library Management System |Search Books</title>
    
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    
    <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    
    <link href="assets/css/style.css" rel="stylesheet" />
    
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <style type="text/css">
        .srch
        {
            padding-left: 300px;
        }
    </style>
</head>
<body>
     
    <div class="container">
            <div class="navbar-header" style="height: 25px">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" >

                    <img id="img2" src="assets/img/peslogo.jpg" />
                </a>

            </div>
<?php if($_SESSION['login'])
{
?>
            <?php }?>
        </div>

    <a id="logout" href="logout.php" class="btn btn-danger pull-right">LOG OUT</a>
         
    <br />
    <br />
<?php include('includes/header1.php');?>

    <div class="content-wrapper">
         <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">Search Books</h4>
    </div>
      
    <div class="srch">
        <form class="navbar-form" method="post" name="form1">
            
                <input class="form-control" type="text" name="search" style="width: 500px" placeholder="Search Books.." required="">
                <button style="background-color: #6db6b9e6;" type="submit" name="submit" class="btn btn-default">
                    <span class="glyphicon glyphicon-search"></span>
                    
                </button>
            
            
        </form>
    </div>




    
<?php 

if(isset($_POST['submit']))
     {

$sql = "SELECT tblbooks.BookName ,tblcategory.CategoryName,tblauthors.AuthorName,tblbooks.ISBNNumber,tblbooks.BookPrice,tblbooks.id as bookid from  tblbooks join tblcategory on tblcategory.id=tblbooks.CatId join tblauthors on tblauthors.id=tblbooks.AuthorId where BookName like '%$_POST[search]%'";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() == 0)
{

    echo "Sorry! No Books Found. Try searching again..";



 }
else if($query->rowCount() > 0)
{

?>

    <div class="row">
                <div class="col-md-12">
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          Available Books
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Book Name</th>
                                            <th>Category </th>
                                            <th>Author</th>
                                            <th>ISBN</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>

 <?php                                       
foreach($results as $result)
{               ?>   







                                   
                                        <tr class="odd gradeX">
                                            <td class="center"><?php echo htmlentities($cnt);?></td>
                                            <td class="center"><?php echo htmlentities($result->BookName);?></td>
                                            <td class="center"><?php echo htmlentities($result->CategoryName);?></td>
                                            <td class="center"><?php echo htmlentities($result->AuthorName);?></td>
                                            <td class="center"><?php echo htmlentities($result->ISBNNumber);?></td>
                                            <td class="center"><?php echo htmlentities($result->BookPrice);?></td>
                                            <td class="center">

                                            </td>
                                        </tr>
     <?php $cnt=$cnt+1;}} } ?>                                      
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                   
                </div>
            </div>




     </div>       
    </div>
    </div>
    <style>
        
    #img2{
        position: relative;
        width: 1000px;
        height: 120px;
        margin-left: 50px;
    }
    .menu-section{
        margin-top: 50px;
    }
        #logout{
            margin-top: 120px;
            margin-left: -50px;
        }    
    </style>

    
  <?php include('includes/footer.php');?>
    
    <script src="assets/js/jquery-1.10.2.js"></script>
    
    <script src="assets/js/bootstrap.js"></script>
    
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
     
    <script src="assets/js/custom.js"></script>
</body>
</html>
<?php  }?>
