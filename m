Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167C8C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 17:16:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE80F20660
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 17:16:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbfAIRQJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 12:16:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53198 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbfAIRQJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 12:16:09 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 22476C0005B2;
        Wed,  9 Jan 2019 17:16:08 +0000 (UTC)
Received: from [10.36.116.249] (ovpn-116-249.ams2.redhat.com [10.36.116.249])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7212767177;
        Wed,  9 Jan 2019 17:16:05 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH QEMU v5] hw/arm/sysbus-fdt: Add support for
 instantiating generic devices
From:   Auger Eric <eric.auger@redhat.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Peter Maydell <peter.maydell@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        qemu-devel@nongnu.org, linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-arm@nongnu.org
References: <20190103094211.28473-1-geert+renesas@glider.be>
 <acd10959-a781-d3bf-dc67-bda878740ec9@redhat.com>
Message-ID: <e1623349-9597-d618-aa02-956d8ae03cd7@redhat.com>
Date:   Wed, 9 Jan 2019 18:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <acd10959-a781-d3bf-dc67-bda878740ec9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 09 Jan 2019 17:16:08 +0000 (UTC)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 1/9/19 4:55 PM, Auger Eric wrote:
> Hi Geert,
> 
> On 1/3/19 10:42 AM, Geert Uytterhoeven wrote:
>> Add a fallback for instantiating generic devices without a type-specific
>> or compatible-specific instantiation method.  This will be used when no
>> other match is found.
>>
>> Generic device instantiation avoids having to write device-specific
>> instantiation methods for each and every "simple" device using only a
>> set of generic properties.  Devices that need more specialized handling
>> can still provide their own instantiation methods.
>>
>> The generic instantiation method creates a device node with remapped
>> "reg" and (optional) "interrupts" properties, and copies properties from
>> the host, if deemed appropriate:
>>   - In general, properties without phandles are safe to be copied.
>>     Unfortunately, the FDT does not carry type information, hence an
>>     explicit whitelist is used, which can be extended when needed.
>>   - Properties related to power management (power and/or clock domain),
>>     isolation, and pin control, are handled by the host, and must not to
>>     be copied.
>>
>> Devices nodes with subnodes are rejected, as subnodes cannot easily be
>> handled in a generic way.
>>
>> This has been tested on a Renesas Salvator-XS board (R-Car H3 ES2.0)
>> with SATA, using:
>>
>>     -device vfio-platform,host=ee300000.sata
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Note: Also tested with GPIO, which needs "vfio: No-IOMMU mode support":
>>
>>     -device vfio-platform,host=e6055400.gpio
>>
>> v5:
>>   - Replace copying of a fixed list of properties (and ignoring all
>>     others), by scanning all properties on the host, and deciding if
>>     they need to be ignored, copied, or rejected,
>>   - Reject device nodes with subnodes,
>>   - Handle edge interrupts,
>>
>> v3:
>>   - New.
>> ---
>>  hw/arm/sysbus-fdt.c | 238 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 238 insertions(+)
>>
>> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
>> index ad698d4832c694be..52de8c9a040c282a 100644
>> --- a/hw/arm/sysbus-fdt.c
>> +++ b/hw/arm/sysbus-fdt.c
>> @@ -28,6 +28,9 @@
>>  #ifdef CONFIG_LINUX
>>  #include <linux/vfio.h>
>>  #endif
>> +#ifdef CONFIG_FNMATCH
>> +#include <fnmatch.h>
>> +#endif
>>  #include "hw/arm/sysbus-fdt.h"
>>  #include "qemu/error-report.h"
>>  #include "sysemu/device_tree.h"
>> @@ -415,6 +418,232 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
>>      return 0;
>>  }
>>  
>> +enum GenericPropertyAction {
>> +    PROP_IGNORE,
>> +    PROP_WARN,
>> +    PROP_COPY,
>> +    PROP_REJECT,
>> +};
>> +
>> +static struct {
>> +    const char *name;
>> +    enum GenericPropertyAction action;
>> +} generic_properties[] = {
>> +    { "name",            PROP_IGNORE }, /* handled automatically */
>> +    { "phandle",         PROP_IGNORE }, /* not needed for the generic case */
>> +
>> +    /* The following are copied and remapped by dedicated code */
>> +    { "reg",             PROP_IGNORE },
>> +    { "interrupts",      PROP_IGNORE },
> Shouldn't interrupt-parent be safely ignored as remapped?
>> +
>> +    /* The following are handled by the host */
>> +    { "power-domains",   PROP_IGNORE }, /* power management (+ opt. clocks) */
>> +    { "iommus",          PROP_IGNORE }, /* isolation */
>> +    { "resets",          PROP_IGNORE }, /* isolation */
>> +    { "pinctrl-*",       PROP_IGNORE }, /* pin control */
>> +
>> +    /* Ignoring the following may or may not work, hence the warning */
>> +    { "gpio-ranges",     PROP_WARN },   /* no support for pinctrl yet */
>> +    { "dmas",            PROP_WARN },   /* no support for external DMACs yet */
> I would be tempted to simply reject things that may not work.
>> +
>> +    /* The following are irrelevant, as corresponding specifiers are ignored */
>> +    { "clock-names",     PROP_IGNORE },
>> +    { "reset-names",     PROP_IGNORE },
>> +    { "dma-names",       PROP_IGNORE },
>> +
>> +    /* Whitelist of properties not taking phandles, and thus safe to copy */
>> +    { "compatible",      PROP_COPY },
>> +    { "status",          PROP_COPY },
>> +    { "reg-names",       PROP_COPY },
>> +    { "interrupt-names", PROP_COPY },
>> +    { "#*-cells",        PROP_COPY },
>> +};
>> +
>> +#ifndef CONFIG_FNMATCH
>> +/* Fall back to exact string matching instead of allowing wildcards */
>> +static inline int fnmatch(const char *pattern, const char *string, int flags)
>> +{
>> +        return strcmp(pattern, string);
>> +}
>> +#endif
>> +
>> +static enum GenericPropertyAction get_generic_property_action(const char *name)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(generic_properties); i++) {
>> +        if (!fnmatch(generic_properties[i].name, name, 0)) {
>> +            return generic_properties[i].action;
>> +        }
>> +    }
>> +
>> +    /*
>> +     * Unfortunately DT properties do not carry type information,
>> +     * so we have to assume everything else contains a phandle,
>> +     * and must be rejected
>> +     */
>> +    return PROP_REJECT;
>> +}
>> +
>> +/**
>> + * copy_generic_node
>> + *
>> + * Copy the generic part of a DT node from the host
>> + */
>> +static void copy_generic_node(void *host_fdt, void *guest_fdt, char *host_path,
>> +                              char *guest_path)
>> +{
>> +    int node, prop, len;
>> +    const void *data;
>> +    const char *name;
>> +    enum GenericPropertyAction action;
>> +
>> +    node = fdt_path_offset(host_fdt, host_path);
>> +    if (node < 0) {
>> +        error_report("Cannot find node %s: %s", host_path, fdt_strerror(node));
>> +        exit(1);
>> +    }
>> +
>> +    /* Submodes are not yet supported */
>> +    if (fdt_first_subnode(host_fdt, node) >= 0) {
>> +        error_report("%s has unsupported subnodes", host_path);
>> +        goto unsupported;
>> +    }
>> +
>> +    /* Copy generic properties */
>> +    fdt_for_each_property_offset(prop, host_fdt, node) {
>> +        data = fdt_getprop_by_offset(host_fdt, prop, &name, &len);
>> +        if (!data) {
>> +            error_report("Cannot get property of %s: %s", host_path,
>> +                         fdt_strerror(len));
>> +            exit(1);
>> +        }
>> +
>> +        if (!len) {
>> +            /* Zero-sized properties are safe to copy */
>> +            action = PROP_COPY;
>> +        } else if (!strcmp(name, "clocks")) {
>> +            /* Reject "clocks" if "power-domains" is not present */
> Could you elaborate on clock management with and without power-domain.
> If clock handles can be found on host side, don't we need to generate
> clock nodes on guest side (as what was done with the amd xgmac). And in
> that case don't you need clock-names prop too?
> 
> Please can you explain how the fact power-domain is not present
> simplifies the problem. It is not obvious to me.
> 
>> +            action = fdt_getprop(host_fdt, node, "power-domains", NULL)
>> +                     ? PROP_WARN : PROP_REJECT;
>> +        } else {
>> +            action = get_generic_property_action(name);
>> +        }
>> +
>> +        switch (action) {
>> +        case PROP_WARN:
>> +            warn_report("%s: Ignoring %s property", host_path, name);
>> +        case PROP_IGNORE:
>> +            break;
>> +
>> +        case PROP_COPY:
>> +            qemu_fdt_setprop(guest_fdt, guest_path, name, data, len);
>> +            break;
>> +
>> +        case PROP_REJECT:
>> +            error_report("%s has unsupported %s property", host_path, name);
>> +            goto unsupported;
>> +        }
>> +    }
>> +    return;
>> +
>> +unsupported:
>> +    error_report("You can ask a wizard to enhance me");
> maybe report which property causes the assignment abort
>> +    exit(1);
>> +}
>> +
>> +/**
>> + * add_generic_fdt_node
>> + *
>> + * Generates a generic DT node by copying properties from the host
>> + */
>> +static int add_generic_fdt_node(SysBusDevice *sbdev, void *opaque)
>> +{
>> +    PlatformBusFDTData *data = opaque;
>> +    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
>> +    const char *parent_node = data->pbus_node_name;
>> +    void *guest_fdt = data->fdt, *host_fdt;
>> +    VFIODevice *vbasedev = &vdev->vbasedev;
>> +    char **node_path, *node_name, *dt_name;
>> +    PlatformBusDevice *pbus = data->pbus;
>> +    uint32_t *reg_attr, *irq_attr;
>> +    uint64_t mmio_base;
>> +    int i, irq_number;
>> +    VFIOINTp *intp;
>> +
>> +    host_fdt = load_device_tree_from_sysfs();
>> +
>> +    dt_name = sysfs_to_dt_name(vbasedev->name);
>> +    if (!dt_name) {
>> +        error_report("%s incorrect sysfs device name %s", __func__,
>> +                     vbasedev->name);
>> +        exit(1);
>> +    }
>> +    node_path = qemu_fdt_node_path(host_fdt, dt_name, vdev->compat,
>> +                                   &error_fatal);
>> +    if (!node_path || !node_path[0]) {
>> +        error_report("%s unable to retrieve node path for %s/%s", __func__,
>> +                     dt_name, vdev->compat);
>> +        exit(1);
>> +    }
>> +
>> +    if (node_path[1]) {
>> +        error_report("%s more than one node matching %s/%s!", __func__,
>> +                     dt_name, vdev->compat);
>> +        exit(1);
>> +    }
> The above part now is duplicated with code in add_amd_xgbe_fdt_node().
> couldn't we factorize this into an helper such like
> char [*]*get_host_node_path(VFIODevice *vbasedev).
>> +
>> +    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
>> +    node_name = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
>> +                               vbasedev->name, mmio_base);
>> +    qemu_fdt_add_subnode(guest_fdt, node_name);
>> +
>> +    /* Copy generic parts from host */
>> +    copy_generic_node(host_fdt, guest_fdt, node_path[0], node_name);
>> +
>> +    /* Copy reg (remapped) */
>> +    reg_attr = g_new(uint32_t, vbasedev->num_regions * 2);
>> +    for (i = 0; i < vbasedev->num_regions; i++) {
>> +        mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, i);
>> +        reg_attr[2 * i] = cpu_to_be32(mmio_base);
>> +        reg_attr[2 * i + 1] = cpu_to_be32(
>> +                                memory_region_size(vdev->regions[i]->mem));
>> +    }
>> +    qemu_fdt_setprop(guest_fdt, node_name, "reg", reg_attr,
>> +                     vbasedev->num_regions * 2 * sizeof(uint32_t));
>> +
>> +    /* Copy interrupts (remapped) */
>> +    if (vbasedev->num_irqs) {
>> +        irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
>> +        for (i = 0; i < vbasedev->num_irqs; i++) {
>> +            irq_number = platform_bus_get_irqn(pbus, sbdev, i) +
>> +                         data->irq_start;
>> +            irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
>> +            irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
>> +            QLIST_FOREACH(intp, &vdev->intp_list, next) {
>> +                if (intp->pin == i) {
>> +                    break;
>> +                }
>> +            }
>> +            if (intp->flags & VFIO_IRQ_INFO_AUTOMASKED) {
>> +                irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>> +            } else {
>> +                irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
>> +            }
>> +        }
>> +        qemu_fdt_setprop(guest_fdt, node_name, "interrupts",
>> +                         irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
>> +        g_free(irq_attr);
while we are at it, I think we should factorize the "reg" and
"interrupts" property generation code and share it with the amd xgmac
node creation function. There are duplicate.

Thanks

Eric
>> +    }
>> +
>> +    g_free(reg_attr);
>> +    g_free(node_name);
>> +    g_strfreev(node_path);
>> +    g_free(dt_name);
>> +    g_free(host_fdt);
>> +    return 0;
>> +}
>> +
>>  /* DT compatible matching */
>>  static bool vfio_platform_match(SysBusDevice *sbdev,
>>                                  const BindingEntry *entry)
>> @@ -423,6 +652,11 @@ static bool vfio_platform_match(SysBusDevice *sbdev,
>>      const char *compat;
>>      unsigned int n;
>>  
>> +    if (!entry->compat) {
>> +        /* Generic DT fallback */
>> +        return true;
>> +    }
>> +
>>      for (n = vdev->num_compat, compat = vdev->compat; n > 0;
>>           n--, compat += strlen(compat) + 1) {
>>          if (!strcmp(entry->compat, compat)) {
>> @@ -459,6 +693,10 @@ static const BindingEntry bindings[] = {
>>      VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
>>  #endif
>>      TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
>> +#ifdef CONFIG_LINUX
>> +    /* Generic DT fallback must be last */
>> +    VFIO_PLATFORM_BINDING(NULL, add_generic_fdt_node),
>> +#endif
>>      TYPE_BINDING("", NULL), /* last element */
>>  };
>>  
>>
> Could you share the SATA node that was generated with the generic function.
> 
> Thanks
> 
> Eric
> 
