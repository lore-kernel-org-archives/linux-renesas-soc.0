Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44536 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728059AbeISPLj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 11:11:39 -0400
Subject: Re: [PATCH v4 3/3] hw/arm/virt: Allow dynamic vfio-platform devices
 again
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Peter Maydell <peter.maydell@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>
Cc: Magnus Damm <damm+renesas@opensource.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        qemu-arm@nongnu.org, qemu-devel@nongnu.org,
        linux-renesas-soc@vger.kernel.org
References: <20180913154458.23939-1-geert+renesas@glider.be>
 <20180913154458.23939-4-geert+renesas@glider.be>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f8fe722d-8abb-c674-7a92-49375586d8c7@redhat.com>
Date: Wed, 19 Sep 2018 11:34:27 +0200
MIME-Version: 1.0
In-Reply-To: <20180913154458.23939-4-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 9/13/18 5:44 PM, Geert Uytterhoeven wrote:
> Allow the instantation of generic dynamic vfio-platform devices again,
> without the need to create a new device-specific vfio type.
> 
> This is more or less a partial revert of commit 6f2062b9758ebc64
> ("hw/arm/virt: Allow only supported dynamic sysbus devices").
nit: his last sentence is arguable as before we allowed any sysbus
device dynamic instantiation. I would simply remove it.

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - s/sysbus/vfio-platform/ in patch description,
> 
> v3:
>   - Drop RFC state,
> 
> v2:
>   - Restrict from TYPE_SYS_BUS_DEVICE to TYPE_VFIO_PLATFORM, as
>     suggested by Eric Auger.
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0b57f87abcbfd54b..e33f7776c72fa9d0 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1758,6 +1758,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
>      mc->block_default_type = IF_VIRTIO;
>      mc->no_cdrom = 1;
>      mc->pci_allow_0_address = true;
> 
