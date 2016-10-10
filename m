Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yangbo Lu <yangbo.lu@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] base: soc: Early register bus when needed
Date: Mon, 10 Oct 2016 16:15:05 +0200
Message-ID: <3420819.lDRyD1Xpvb@wuerfel>
In-Reply-To: <1475572167-29581-2-git-send-email-geert+renesas@glider.be>
References: <1475572167-29581-1-git-send-email-geert+renesas@glider.be> <1475572167-29581-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tuesday, October 4, 2016 11:09:24 AM CEST Geert Uytterhoeven wrote:
> If soc_device_register() is called before soc_bus_register(), it crashes
> with a NULL pointer dereference.
> 
> soc_bus_register() is already a core_initcall(), but drivers/base/ is
> entered later than e.g. drivers/pinctrl/ and drivers/soc/. Hence there
> are several subsystems that may need to know SoC revision information,
> while it's not so easy to initialize the SoC bus even earlier using an
> initcall.
> 
> To fix this, let soc_device_register() register the bus early if that
> hasn't happened yet.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 

Not nice, but I can't think of a better alternative, so

Acked-by: Arnd Bergmann <arnd@arndb.de>
