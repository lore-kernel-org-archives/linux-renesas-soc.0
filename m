Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:48474 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbeKESgC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 13:36:02 -0500
Subject: New crash (was: Re: [PATCH qemu v5 2/3] hw/arm/sysbus-fdt: Allow
 device matching with DT compatible value)
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Peter Maydell <peter.maydell@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        qemu-devel@nongnu.org, linux-renesas-soc@vger.kernel.org,
        Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
        Eduardo Habkost <ehabkost@redhat.com>
References: <20180927115454.31471-1-geert+renesas@glider.be>
 <20180927115454.31471-3-geert+renesas@glider.be>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2f7f45ec-c689-2cd4-e44f-90c82b47d151@redhat.com>
Date: Mon, 5 Nov 2018 10:17:06 +0100
MIME-Version: 1.0
In-Reply-To: <20180927115454.31471-3-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-09-27 13:54, Geert Uytterhoeven wrote:
> From: Auger Eric <eric.auger@redhat.com>
> 
> Up to now we have relied on the device type to identify a device tree
> node creation function.  Since we would like the vfio-platform device to
> be instantiable with different compatible strings we introduce the
> capability to specialize the node creation depending on actual
> compatible value.
> 
> NodeCreationPair is renamed into BindingEntry. The struct is enhanced
> with compat and match_fn() fields.  We introduce a new matching function
> adapted to the vfio-platform generic device.
> 
> Soon, the AMD XGBE can be instantiated with either manner, i.e.:
> 
>     -device vfio-amd-xgbe,host=e0900000.xgmac
> 
> or using the new option line:
> 
>     -device vfio-platform,host=e0900000.xgmac
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> [geert: Match using compatible values in sysfs instead of user-supplied
> 	manufacturer/model options, reword]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>

scripts/device-crash-test reports a new "crash" with current QEMU master
branch, where QEMU aborts like this:

aarch64-softmmu/qemu-system-aarch64 -S -machine virt-2.9,accel=tcg
-device ramfb
hw/arm/sysbus-fdt.c:422:vfio_platform_match: Object 0x564cf9ae8f80 is
not an instance of type vfio-platform
Aborted (core dumped)

I think it is likely due to this patch here ... any chance that you
could make this a little bit more user friendly instead of aborting the
hard way here?

 Thanks,
  Thomas
