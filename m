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
Subject: Re: [PATCH 3/4] base: soc: Check for NULL SoC device attributes
Date: Mon, 10 Oct 2016 16:13:45 +0200
Message-ID: <1521283.2YYXpcZaoN@wuerfel>
In-Reply-To: <1475572167-29581-4-git-send-email-geert+renesas@glider.be>
References: <1475572167-29581-1-git-send-email-geert+renesas@glider.be> <1475572167-29581-4-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tuesday, October 4, 2016 11:09:26 AM CEST Geert Uytterhoeven wrote:
> If soc_device_match() is used to check the value of a specific
> attribute that is not present for the current SoC, the kernel crashes
> with a NULL pointer dereference.
> 
> Fix this by explicitly checking for the absence of a needed property,
> and considering this a non-match.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>
