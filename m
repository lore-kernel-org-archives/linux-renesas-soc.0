Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:37136
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752339AbdHPS7x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 14:59:53 -0400
Date: Wed, 16 Aug 2017 20:59:50 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, kbuild-all@01.org
Subject: [renesas-drivers:clk-renesas-for-v4.14 10/11]
 drivers/clk/renesas/rcar-usb2-clock-sel.c:149:5-17: duplicated argument to
 && or || (fwd)
Message-ID: <alpine.DEB.2.20.1708162058410.2102@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On line 149, it looks like one extal should instead be xtal.

julia

---------- Forwarded message ----------
Date: Thu, 17 Aug 2017 02:43:28 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: [renesas-drivers:clk-renesas-for-v4.14 10/11]
    drivers/clk/renesas/rcar-usb2-clock-sel.c:149:5-17: duplicated argument to
    && or ||

CC: kbuild-all@01.org
CC: linux-renesas-soc@vger.kernel.org
TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git clk-renesas-for-v4.14
head:   344fae7f354bdb869115212a56d39d5f2034466d
commit: 0b2934329320899150286a7fdec9c7d143d0bdb9 [10/11] clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago

>> drivers/clk/renesas/rcar-usb2-clock-sel.c:149:5-17: duplicated argument to && or ||

# https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?id=0b2934329320899150286a7fdec9c7d143d0bdb9
git remote add renesas-drivers https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
git remote update renesas-drivers
git checkout 0b2934329320899150286a7fdec9c7d143d0bdb9
vim +149 drivers/clk/renesas/rcar-usb2-clock-sel.c

0b293432 Yoshihiro Shimoda 2017-07-25  116
0b293432 Yoshihiro Shimoda 2017-07-25  117  static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
0b293432 Yoshihiro Shimoda 2017-07-25  118  {
0b293432 Yoshihiro Shimoda 2017-07-25  119  	struct device *dev = &pdev->dev;
0b293432 Yoshihiro Shimoda 2017-07-25  120  	struct device_node *np = dev->of_node;
0b293432 Yoshihiro Shimoda 2017-07-25  121  	struct usb2_clock_sel_priv *priv;
0b293432 Yoshihiro Shimoda 2017-07-25  122  	struct resource *res;
0b293432 Yoshihiro Shimoda 2017-07-25  123  	struct clk *clk;
0b293432 Yoshihiro Shimoda 2017-07-25  124  	struct clk_init_data init;
0b293432 Yoshihiro Shimoda 2017-07-25  125
0b293432 Yoshihiro Shimoda 2017-07-25  126  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
0b293432 Yoshihiro Shimoda 2017-07-25  127  	if (!priv)
0b293432 Yoshihiro Shimoda 2017-07-25  128  		return -ENOMEM;
0b293432 Yoshihiro Shimoda 2017-07-25  129
0b293432 Yoshihiro Shimoda 2017-07-25  130  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
0b293432 Yoshihiro Shimoda 2017-07-25  131  	priv->base = devm_ioremap_resource(dev, res);
0b293432 Yoshihiro Shimoda 2017-07-25  132  	if (IS_ERR(priv->base))
0b293432 Yoshihiro Shimoda 2017-07-25  133  		return PTR_ERR(priv->base);
0b293432 Yoshihiro Shimoda 2017-07-25  134
0b293432 Yoshihiro Shimoda 2017-07-25  135  	pm_runtime_enable(dev);
0b293432 Yoshihiro Shimoda 2017-07-25  136  	pm_runtime_get_sync(dev);
0b293432 Yoshihiro Shimoda 2017-07-25  137
0b293432 Yoshihiro Shimoda 2017-07-25  138  	clk = devm_clk_get(dev, "usb_extal");
0b293432 Yoshihiro Shimoda 2017-07-25  139  	if (!IS_ERR(clk) && !clk_prepare_enable(clk)) {
0b293432 Yoshihiro Shimoda 2017-07-25  140  		priv->extal = !!clk_get_rate(clk);
0b293432 Yoshihiro Shimoda 2017-07-25  141  		clk_disable_unprepare(clk);
0b293432 Yoshihiro Shimoda 2017-07-25  142  	}
0b293432 Yoshihiro Shimoda 2017-07-25  143  	clk = devm_clk_get(dev, "usb_xtal");
0b293432 Yoshihiro Shimoda 2017-07-25  144  	if (!IS_ERR(clk) && !clk_prepare_enable(clk)) {
0b293432 Yoshihiro Shimoda 2017-07-25  145  		priv->xtal = !!clk_get_rate(clk);
0b293432 Yoshihiro Shimoda 2017-07-25  146  		clk_disable_unprepare(clk);
0b293432 Yoshihiro Shimoda 2017-07-25  147  	}
0b293432 Yoshihiro Shimoda 2017-07-25  148
0b293432 Yoshihiro Shimoda 2017-07-25 @149  	if (!priv->extal && !priv->extal) {
0b293432 Yoshihiro Shimoda 2017-07-25  150  		dev_err(dev, "This driver needs usb_extal or usb_xtal\n");
0b293432 Yoshihiro Shimoda 2017-07-25  151  		return -ENOENT;
0b293432 Yoshihiro Shimoda 2017-07-25  152  	}
0b293432 Yoshihiro Shimoda 2017-07-25  153
0b293432 Yoshihiro Shimoda 2017-07-25  154  	platform_set_drvdata(pdev, priv);
0b293432 Yoshihiro Shimoda 2017-07-25  155  	dev_set_drvdata(dev, priv);
0b293432 Yoshihiro Shimoda 2017-07-25  156
0b293432 Yoshihiro Shimoda 2017-07-25  157  	init.name = "rcar_usb2_clock_sel";
0b293432 Yoshihiro Shimoda 2017-07-25  158  	init.ops = &usb2_clock_sel_clock_ops;
0b293432 Yoshihiro Shimoda 2017-07-25  159  	init.flags = 0;
0b293432 Yoshihiro Shimoda 2017-07-25  160  	init.parent_names = NULL;
0b293432 Yoshihiro Shimoda 2017-07-25  161  	init.num_parents = 0;
0b293432 Yoshihiro Shimoda 2017-07-25  162  	priv->hw.init = &init;
0b293432 Yoshihiro Shimoda 2017-07-25  163
0b293432 Yoshihiro Shimoda 2017-07-25  164  	clk = clk_register(NULL, &priv->hw);
0b293432 Yoshihiro Shimoda 2017-07-25  165  	if (IS_ERR(clk))
0b293432 Yoshihiro Shimoda 2017-07-25  166  		return PTR_ERR(clk);
0b293432 Yoshihiro Shimoda 2017-07-25  167
0b293432 Yoshihiro Shimoda 2017-07-25  168  	return of_clk_add_hw_provider(np, of_clk_hw_simple_get, &priv->hw);
0b293432 Yoshihiro Shimoda 2017-07-25  169  }
0b293432 Yoshihiro Shimoda 2017-07-25  170

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
