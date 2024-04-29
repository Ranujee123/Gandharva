<style>
    nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-family: "Roboto", sans-serif;
        background-color: #000;
        padding: 0 50px;
        height: 75px;
    }

    nav img {
        border: none;
        height: 75px;
    }

    nav .buttons a {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 10px;
        font-size: 15px;
        color: #fff;
        text-decoration: none;
    }

    nav .buttons #sign-out-icon {
        height: 25px;
        width: 25px;
    }
</style>
<nav>
    <img src="../images/logo.png" alt="company-logo" />

    <div class="buttons">
        <a href="javascript:history.back();"><img src="../images/sign-out-icon.png" alt="" id="sign-out-icon" />Back</a>
    </div>
</nav>
