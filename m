Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:51140 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730650AbeK1Dms (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Nov 2018 22:42:48 -0500
Date: Tue, 27 Nov 2018 17:44:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH/RFC] net: phy: device: Don't deassert the reset when
 register and probe
Message-ID: <20181127164411.GB19601@lunn.ch>
References: <1543320947-32763-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543320947-32763-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 27, 2018 at 12:18:20PM +0000, Yoshihiro Shimoda wrote:
> Some PHY device needs edge signal of the reset, but the previous code
> is impossible to achieve it like following:
> 
>  1) Kernel boots by using initramfs.
>  --> No open the nic, so the provious code deasserts the reset by
>      phy_device_register() and phy_probe().
>  2) Kernel enters the suspend.
>  --> So, keep the reset signal as deassert.
>  --> On R-Car Salvator-XS board, unfortunately, the board power is
>      turned off.
>  3) Kernel returns from suspend.
>  4) ifconfig eth0 up
>  --> Then, since edge signal of the reset doesn't happen,
>      it cannot link up.

Hi Yoshihiro

It sounds like you should be adding code to the suspend/resume
handling of phylib, so that it toggle the reset on resume. You cannot
just delete code like you proposed, it is going to break devices. But
adding code should be O.K.

       Andrew
