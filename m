Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC849C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 13:16:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A60520870
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 13:16:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbfAVNQW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 08:16:22 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:43502 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728310AbfAVNQW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 08:16:22 -0500
Received: by mail-ua1-f65.google.com with SMTP id z11so8012506uaa.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jan 2019 05:16:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ya7IsAsR0KNPKhbfL7h0VNp+zJxstwhRrdJhvx+v30U=;
        b=IMzWapxBz3DKAVYEeiEI/7HgyYmeX/dDkg1UgciY7jZmHeA2YYXNAfUP6A9ycQQOel
         hHB64f/um7ys80zLdfWNhKqiCv3v5sQp1dWcYBdRb/c87GFYmYizsvPx4N/JXd+NheyX
         8GcfqGada6BWyyZnt1K0mgiZUR7bMi/YoIQoTyRHicC2emJskVp9aHib9MiwCrxiPu+x
         E7gS/mhV+MAJNdz1BW3Rnts/ctSoVCAhLXr+sIs7n5CK4eINbhhWftwe5OgJy4QmCAJL
         rynVkyWbB2w+CNNgnr3WHfGJIop2gK7UeMPMgbzMCNCP+qAaJJasMild7dQ8CLQW18pA
         Rp0g==
X-Gm-Message-State: AJcUukdYWBXyB8b2DtB38rmrZfE6gudTvjVF5QHfn1XEUsp2W98Lh/W3
        JJGuFTb3qKNJh7dcWnNQrog6N9kQjACo+PYyTc0TSg==
X-Google-Smtp-Source: ALg8bN6WA4OANto3PFHx66IKojS2bEXJ4/ke7Q6T5zwT9bXxqhD5NATQ2H7CMWCerZ7DM73B0p/l6vnTi2sopYOiJ8Y=
X-Received: by 2002:ab0:1393:: with SMTP id m19mr13185270uae.75.1548162980542;
 Tue, 22 Jan 2019 05:16:20 -0800 (PST)
MIME-Version: 1.0
References: <TY2PR01MB4812D22909738F4D981B359ED8980@TY2PR01MB4812.jpnprd01.prod.outlook.com>
 <CAMuHMdUXKCzr33WNAznQN9v699vxg3sic2s78RxhVXfJePL1wg@mail.gmail.com> <TY2PR01MB4812614B9FFE4EA11A010DF9D8980@TY2PR01MB4812.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB4812614B9FFE4EA11A010DF9D8980@TY2PR01MB4812.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Jan 2019 14:16:08 +0100
Message-ID: <CAMuHMdVZ4+X+3=SHsizF=eUg1Dwcks1HxNEUfBRMOuDfEmV2pQ@mail.gmail.com>
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

On Tue, Jan 22, 2019 at 12:06 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, January 22, 2019 7:59 PM
> > On Tue, Jan 22, 2019 at 11:23 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > I got a report from test team that next-20190122 could not probe the ravb driver as the following.
> > > The test team is using H3 ES3.0 Salvator-XS and I could also reproduce this issue on M3-N Salvator-XS.
> > >
> > > [ 3.005557] ravb e6800000.ethernet: ignoring dependency for device, assuming no driver
> > > [ 3.013863] libphy: ravb_mii: probed
> > > [ 3.017743] mdio_bus e6800000.ethernet-ffffffff:00: error -2 loading PHY driver module for ID 0x00221622
> > > [ 3.027283] ravb e6800000.ethernet: failed to initialize MDIO
> > > [ 3.033157] ravb: probe of e6800000.ethernet failed with error -2
> > >
> > > # I didn't investigate this issue yet though...
> >
> > Looks like other people see this on other SoCs, too.
> > But I didn't see a solution mentioned in those threads.
>
> Oh, I got it.
>
> > FWIW, I'm not seeing it with the soon-to-be-released renesas-drivers of
> > today, so the breakage is not in net-next.
>
> It's good news! I had worried about this renesas-drivers :)

Unfortunately I have to amend my comment above: while the issue does not
happen with renesas_defconfig or shmobile_defconfig, it do see such failures
with other board-specific configs. Will investigate...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
