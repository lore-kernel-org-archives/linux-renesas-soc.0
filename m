Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DD7C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 14:06:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89FDC21019
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 14:06:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbfAVOGr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 09:06:47 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41724 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbfAVOGr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 09:06:47 -0500
Received: by mail-vs1-f65.google.com with SMTP id t17so14733041vsc.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jan 2019 06:06:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OBJkMNNwFfDDZ36HXiKb+th2SBbUMlLT95PMzrLq+00=;
        b=NxtoZnYqo+GomYwfUmMf7kDoT+I3D71R5jbvMk2CHLWPowTknkDa8AzXD1l5mv8YUj
         f/BERSW9jOlkm2saKkbzGL3O4VSmrypNggsxqoT8UZRH1kCVMvILm2YGSWA3LO8YgoRI
         mfsHj+EKSRmDE9R6YprE3QnWkN5vP8JRyJs2vf7IphmP5eH+CHzK1yBN28a2Q2kfciZJ
         i1zn8MyT/I7TTASGRx/TLgiFsxTRTyhEKuwfLa7AqhXa/mn8TbUUwCiIj4BpJlZHZYJx
         Zmfqdw4WxSuqu1LDhc8cxcRIKuZcJpgMhY9xNZiHg357tVjhastbQisNHZnlk6qqPtIo
         5g6Q==
X-Gm-Message-State: AJcUukcxfB4rKTDi+Iach8F3OTGhkxvzb5s3KTG1i4lgYZ1eXpsX3We2
        PSrX4wFf/9hkXoiXOGo8NAxHwVS4ESobEDL9AaI=
X-Google-Smtp-Source: ALg8bN4AxCeYM2vJ3PdbRHcYbTkx2E/Cr4Dl5a34SE7yqlRtdwH8bfPf5SAgQ2Hrd/gnbJZ8M/8yuRbYd5uejZ+Qqbw=
X-Received: by 2002:a67:c202:: with SMTP id i2mr13602569vsj.11.1548166005324;
 Tue, 22 Jan 2019 06:06:45 -0800 (PST)
MIME-Version: 1.0
References: <TY2PR01MB4812D22909738F4D981B359ED8980@TY2PR01MB4812.jpnprd01.prod.outlook.com>
 <CAMuHMdUXKCzr33WNAznQN9v699vxg3sic2s78RxhVXfJePL1wg@mail.gmail.com>
 <TY2PR01MB4812614B9FFE4EA11A010DF9D8980@TY2PR01MB4812.jpnprd01.prod.outlook.com>
 <CAMuHMdVZ4+X+3=SHsizF=eUg1Dwcks1HxNEUfBRMOuDfEmV2pQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVZ4+X+3=SHsizF=eUg1Dwcks1HxNEUfBRMOuDfEmV2pQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Jan 2019 15:06:33 +0100
Message-ID: <CAMuHMdV0j7dEz+iq+SZn4XDWkL=MO8uTvGU65h_pJ7_DzzoW1w@mail.gmail.com>
Subject: Re: BUG report on next-20190122: could not probe the ravb driver
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Jan 22, 2019 at 2:16 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Jan 22, 2019 at 12:06 PM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > From: Geert Uytterhoeven, Sent: Tuesday, January 22, 2019 7:59 PM
> > > On Tue, Jan 22, 2019 at 11:23 AM Yoshihiro Shimoda
> > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > I got a report from test team that next-20190122 could not probe the ravb driver as the following.
> > > > The test team is using H3 ES3.0 Salvator-XS and I could also reproduce this issue on M3-N Salvator-XS.
> > > >
> > > > [ 3.005557] ravb e6800000.ethernet: ignoring dependency for device, assuming no driver
> > > > [ 3.013863] libphy: ravb_mii: probed
> > > > [ 3.017743] mdio_bus e6800000.ethernet-ffffffff:00: error -2 loading PHY driver module for ID 0x00221622
> > > > [ 3.027283] ravb e6800000.ethernet: failed to initialize MDIO
> > > > [ 3.033157] ravb: probe of e6800000.ethernet failed with error -2
> > > >
> > > > # I didn't investigate this issue yet though...
> > >
> > > Looks like other people see this on other SoCs, too.
> > > But I didn't see a solution mentioned in those threads.
> >
> > Oh, I got it.
> >
> > > FWIW, I'm not seeing it with the soon-to-be-released renesas-drivers of
> > > today, so the breakage is not in net-next.
> >
> > It's good news! I had worried about this renesas-drivers :)
>
> Unfortunately I have to amend my comment above: while the issue does not
> happen with renesas_defconfig or shmobile_defconfig, it do see such failures

Both have CONFIG_MODULES=n.

> with other board-specific configs. Will investigate...

With CONFIG_MODULES=y, the issue happens.
Please revert commit 13d0ab6750b20957 ("net: phy: check return code when
requesting PHY driver module") to fix it (for now).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
