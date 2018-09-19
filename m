Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:37754 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728059AbeISPLc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 11:11:32 -0400
Subject: Re: [PATCH v4 1/3] vfio/platform: Make the vfio-platform device
 non-abstract
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
 <20180913154458.23939-2-geert+renesas@glider.be>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5376dc54-2845-4f23-9581-ff5447a00cdc@redhat.com>
Date: Wed, 19 Sep 2018 11:34:21 +0200
MIME-Version: 1.0
In-Reply-To: <20180913154458.23939-2-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 9/13/18 5:44 PM, Geert Uytterhoeven wrote:
> From: Auger Eric <eric.auger@redhat.com>
> 
> Up to now the vfio-platform device has been abstract and could not be
> instantiated.  The integration of a new vfio platform device required
> creating a dummy derived device which only set the compatible string.
> 
> Following the few vfio-platform device integrations we have seen the
> actual requested adaptation happens on device tree node creation
> (sysbus-fdt).
> 
> Hence remove the abstract setting, and read the list of compatible
> values from sysfs if not set by a derived device.
> 
> Update the amd-xgbe and calxeda-xgmac drivers to fill in the number of
> compatible values, as there can now be more than one.
> 
> Note that sysbus-fdt does not support the instantiation of the
> vfio-platform device yet.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> [geert: Rebase, set user_creatable=true, use compatible values in sysfs
> 	instead of user-supplied manufacturer/model options, reword]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - Propagate g_file_get_contents() errors through errp,
> 
> v3:
>   - Read all compatible values from sysfs instead of using user-supplied
>     manufacturer and model options,
>   - Reword patch description,
>   - Drop RFC state,
> 
> v2:
>   - No changes,
> 
> v1:
>   - Rebase, Set user_creatable=true,
> 
> v0:
>   - Original version from Eric.
> ---
>  hw/vfio/amd-xgbe.c              |  1 +
>  hw/vfio/calxeda-xgmac.c         |  1 +
>  hw/vfio/platform.c              | 24 +++++++++++++++++++++++-
>  include/hw/vfio/vfio-platform.h |  3 ++-
>  4 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/amd-xgbe.c b/hw/vfio/amd-xgbe.c
> index 0c4ec4ba25170366..ee64a3b4a2e45bf5 100644
> --- a/hw/vfio/amd-xgbe.c
> +++ b/hw/vfio/amd-xgbe.c
> @@ -20,6 +20,7 @@ static void amd_xgbe_realize(DeviceState *dev, Error **errp)
>      VFIOAmdXgbeDeviceClass *k = VFIO_AMD_XGBE_DEVICE_GET_CLASS(dev);
>  
>      vdev->compat = g_strdup("amd,xgbe-seattle-v1a");
> +    vdev->num_compat = 1;
>  
>      k->parent_realize(dev, errp);
>  }
> diff --git a/hw/vfio/calxeda-xgmac.c b/hw/vfio/calxeda-xgmac.c
> index 24cee6d06512c1b6..e7767c4b021be566 100644
> --- a/hw/vfio/calxeda-xgmac.c
> +++ b/hw/vfio/calxeda-xgmac.c
> @@ -20,6 +20,7 @@ static void calxeda_xgmac_realize(DeviceState *dev, Error **errp)
>      VFIOCalxedaXgmacDeviceClass *k = VFIO_CALXEDA_XGMAC_DEVICE_GET_CLASS(dev);
>  
>      vdev->compat = g_strdup("calxeda,hb-xgmac");
> +    vdev->num_compat = 1;
>  
>      k->parent_realize(dev, errp);
>  }
> diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
> index 57c4a0ee2b58da70..894333c602eb6fd2 100644
> --- a/hw/vfio/platform.c
> +++ b/hw/vfio/platform.c
> @@ -655,6 +655,27 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
>          goto out;
>      }
>  
> +    if (!vdev->compat) {
> +        GError *gerr = NULL;
> +        gchar *contents;
> +        gsize length;
> +        char *path;
> +
> +        path = g_strdup_printf("%s/of_node/compatible", vbasedev->sysfsdev);
> +        if (!g_file_get_contents(path, &contents, &length, &gerr)) {
> +            error_setg(errp, "%s", gerr->message);
> +            g_error_free(gerr);
leaks path
> +            return;
> +        }
> +        g_free(path);
> +        vdev->compat = contents;
> +        for (vdev->num_compat = 0; length; vdev->num_compat++) {
> +            size_t skip = strlen(contents) + 1;
> +            contents += skip;
> +            length -= skip;
> +        }
> +    }
> +
>      for (i = 0; i < vbasedev->num_regions; i++) {
>          if (vfio_region_mmap(vdev->regions[i])) {
>              error_report("%s mmap unsupported. Performance may be slow",
> @@ -700,6 +721,8 @@ static void vfio_platform_class_init(ObjectClass *klass, void *data)
>      dc->desc = "VFIO-based platform device assignment";
>      sbc->connect_irq_notifier = vfio_start_irqfd_injection;
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    /* Supported by TYPE_VIRT_MACHINE */
> +    dc->user_creatable = true;
>  }
>  
>  static const TypeInfo vfio_platform_dev_info = {
> @@ -708,7 +731,6 @@ static const TypeInfo vfio_platform_dev_info = {
>      .instance_size = sizeof(VFIOPlatformDevice),
>      .class_init = vfio_platform_class_init,
>      .class_size = sizeof(VFIOPlatformDeviceClass),
> -    .abstract   = true,
>  };
>  
>  static void register_vfio_platform_dev_type(void)
> diff --git a/include/hw/vfio/vfio-platform.h b/include/hw/vfio/vfio-platform.h
> index 9baaa2db09b84f3e..0ee10b1d71ed2503 100644
> --- a/include/hw/vfio/vfio-platform.h
> +++ b/include/hw/vfio/vfio-platform.h
> @@ -54,7 +54,8 @@ typedef struct VFIOPlatformDevice {
>      QLIST_HEAD(, VFIOINTp) intp_list; /* list of IRQs */
>      /* queue of pending IRQs */
>      QSIMPLEQ_HEAD(pending_intp_queue, VFIOINTp) pending_intp_queue;
> -    char *compat; /* compatibility string */
> +    char *compat; /* DT compatible values, separated by NUL */
> +    unsigned int num_compat; /* number of compatible values */
>      uint32_t mmap_timeout; /* delay to re-enable mmaps after interrupt */
>      QEMUTimer *mmap_timer; /* allows fast-path resume after IRQ hit */
>      QemuMutex intp_mutex; /* protect the intp_list IRQ state */
> 
With leak fix,
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
