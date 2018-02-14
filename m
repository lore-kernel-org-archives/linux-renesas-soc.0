Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42166 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S967115AbeBNKhW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 05:37:22 -0500
Subject: Re: [PATCH/RFC 3/5] hw/arm/virt: Allow dynamic sysbus devices again
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Peter Maydell <peter.maydell@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
 <1518189456-2873-4-git-send-email-geert+renesas@glider.be>
Cc: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>, Alexander Graf <agraf@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-arm@nongnu.org, qemu-devel@nongnu.org,
        linux-renesas-soc@vger.kernel.org
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3ee22637-a0a9-306a-4e6d-14295d4bcb27@redhat.com>
Date: Wed, 14 Feb 2018 11:37:11 +0100
MIME-Version: 1.0
In-Reply-To: <1518189456-2873-4-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,
On 09/02/18 16:17, Geert Uytterhoeven wrote:
> Allow the instantation of generic dynamic sysbus devices again, without
> the need to create a new device-specific vfio type.
> 
> This is a partial revert of commit  6f2062b9758ebc64 ("hw/arm/virt:
> Allow only supported dynamic sysbus devices").
> 
> Not-Yet-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b334c82edae9fb1f..fa83784fc08ed076 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1596,6 +1596,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->max_cpus = 255;
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
Couldn't you limit that to TYPE_VFIO_PLATFORM instead?

Thanks

Eric
>      mc->block_default_type = IF_VIRTIO;
>      mc->no_cdrom = 1;
>      mc->pci_allow_0_address = true;
> 
