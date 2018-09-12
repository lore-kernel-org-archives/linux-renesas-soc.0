Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:40478 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbeILRky (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Sep 2018 13:40:54 -0400
Received: by mail-ua1-f67.google.com with SMTP id 101-v6so1494709uav.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Sep 2018 05:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180810122602.5w2tackcqwoeclj6@verge.net.au> <TYXPR01MB1518C6FA9560CD45BF7684F9A8390@TYXPR01MB1518.jpnprd01.prod.outlook.com>
 <20180817091956.vm77iv73cwkkjelv@verge.net.au> <20180817093854.dz6xqwqcf4z7ncxu@verge.net.au>
 <20180817105237.7tnijrheywh3fx46@verge.net.au>
In-Reply-To: <20180817105237.7tnijrheywh3fx46@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Sep 2018 14:36:21 +0200
Message-ID: <CAMuHMdVK8GYXfW=f=5VntHozN__gvuGZLbcxPSHL5ueiis3DbA@mail.gmail.com>
Subject: Re: [LTSI-dev] [GIT PULL LTSI-4.14] Renesas SoCs and Drivers to v4.18-rc8
To: Simon Horman <horms@verge.net.au>
Cc: Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        ltsi-dev@lists.linuxfoundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Aug 17, 2018 at 12:53 PM Simon Horman <horms@verge.net.au> wrote:
> please find the details of the corrected tag below:
>
>
> The following changes since commit 2ae6c0413b4768f9d8fc6f718a732f9dae014b67:
>
>   Linux 4.14.61 (2018-08-06 16:20:52 +0200)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git backport/v4.14.61/snapshot-to-v4.18-rc8+fixes-flattened
>
> for you to fetch changes up to cc88cfdc0571385f098e82db47f5a16b6f44726e:
>
>   i2c: rcar: use the new get_bus_free callback (2018-08-09 17:22:00 +0200)
>
> ----------------------------------------------------------------
> LTSI-v4.14 Backports for Renesas SoCs (to v4.18-rc8)
>
> Base:
> * v4.14.61
> * Similar backport of components for Renesas SoCs to v4.17
>
> Backports of the following components to their standard as of v4.18-rc8:

> * pcie-rcar

The backports of 3a8f77e48666a39a ("PCI: OF: Add generic function to parse
and allocate PCI resources") and f7e1c6461e04afb8 ("PCI: rcar: Reuse
generic pci_parse_request_of_pci_ranges() function") had to be adjusted, as
v4.14.67 gained commit 0e66392d985c4595 ("PCI: OF: Fix I/O space page
leak"), which is different from the upstream solution due to dependencies.

Resulting change:

--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -112,7 +112,7 @@ int pci_parse_request_of_pci_ranges(struct device *dev,

                switch (resource_type(res)) {
                case IORESOURCE_IO:
-                       err = pci_remap_iospace(res, iobase);
+                       err = devm_pci_remap_iospace(dev, res, iobase);
                        if (err) {
                                dev_warn(dev, "error %d: failed to map
resource %pR\n",
                                         err, res);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
