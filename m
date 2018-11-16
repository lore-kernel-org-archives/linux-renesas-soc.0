Return-Path: <linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org>
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "greenfoo@gluegarage.com" <greenfoo@gluegarage.com>
Subject: Re: [PATCH 3/9] drm: replace "drm_dev_unref" function with
 "drm_dev_put"
Date: Fri, 16 Nov 2018 11:41:18 +0000
Message-ID: <32f96995d5abf3844975a156dee38d21ea666c52.camel@synopsys.com>
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
 <20181115221634.22715-4-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-4-greenfoo@gluegarage.com>
Content-Language: en-US
Content-ID: <B9E7E6A20DE7D5499B13226914B51ECA@internal.synopsys.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "Gilles.Muller@lip6.fr" <Gilles.Muller@lip6.fr>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>,
 "marex@denx.de" <marex@denx.de>,
 "architt@codeaurora.org" <architt@codeaurora.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "linux+etnaviv@armlinux.org.uk" <linux+etnaviv@armlinux.org.uk>,
 "nicolas.palix@imag.fr" <nicolas.palix@imag.fr>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "christian.gmeiner@gmail.com" <christian.gmeiner@gmail.com>,
 "stefan@agner.ch" <stefan@agner.ch>, "sean@poorly.run" <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
 "Julia.Lawall@lip6.fr" <Julia.Lawall@lip6.fr>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fernando,

On Thu, 2018-11-15 at 23:16 +0100, Fernando Ramos wrote:
> This patch unifies the naming of DRM functions for reference counting as
> requested on Documentation/gpu/todo.rst
> 
> Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>
> ---
>  drivers/gpu/drm/arc/arcpgu_drv.c             | 4 ++--

For ARCPGU

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
