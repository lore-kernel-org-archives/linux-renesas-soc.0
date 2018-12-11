Return-Path: <SRS0=uxQs=OU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C3AC5CFFE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 08:17:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 045F120849
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 08:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 045F120849
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbeLKIRN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 03:17:13 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:34284 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbeLKIRN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 03:17:13 -0500
Received: by mail-ua1-f65.google.com with SMTP id z23so4839701uam.1;
        Tue, 11 Dec 2018 00:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OG3jhhYUwRUu4UBEIDGtjtWrtyYywT5I18eb4ncG2i0=;
        b=UsBngF/WHKyAMMysTmgauCA02mlODvd5PkqSWYzH4e/Fco2C/SSFzlkKEXqCaBgg55
         fjuOrRvOBF/b0ptPURO9CMOm6rwwkuUWAcqoNP6S5VfNb6ns9uEgeAAJ0oJc3pajE3ep
         wRxENPIlYDoEeSBo7ef7KahExP8RiQWnF1SmdXRcHZScpk+dM+I9DMf2j5htMSkOxk2/
         m+obDLaNR9YAfdB6dxbnhnkj2Mu6ORTkSb19M5SMRH3pm5o0riwhghbtsp4tLR2SykL1
         ecLS+D+Pc5dBLBLflUx5a0HLUuuEeo8bQ3Zcq8tLOrtsrrktdmLvCQmmWK4P2vYghmb3
         WIaw==
X-Gm-Message-State: AA+aEWbOCAeSXd/Wohe66rfo2uFK0fMMe6QchAR5CzZINv7wGrDCm5aB
        rptMmyAW/MNkrGgv2b1Qb0BvzwYDnWJT5Ww8Gpk=
X-Google-Smtp-Source: AFSGD/UX1zguuCnZAiMkaqVXvuV9wlI3VSAPe6izT+RmObxnLx5o+FfMTv24PZ22FDSb733p+wVUuKHk+lSA/nMUVv8=
X-Received: by 2002:ab0:465:: with SMTP id 92mr6960808uav.28.1544516231757;
 Tue, 11 Dec 2018 00:17:11 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdUgYFkYrpnpOdrE5ce-pHSUqLPPs=gheitp5sAnu=srEQ@mail.gmail.com>
 <20181207013513.GV768@umbus.fritz.box> <CAMuHMdUdPKb6go3U46fJsWdfDrx057SPem-ZDi9wOJhfaeCENQ@mail.gmail.com>
 <20181210054928.GR4261@umbus.fritz.box> <0039cd72-2ad1-529e-67b4-44f9eb318d54@gmail.com>
In-Reply-To: <0039cd72-2ad1-529e-67b4-44f9eb318d54@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 Dec 2018 09:16:59 +0100
Message-ID:
 <CAMuHMdVv0vbzydajMN_YdtNA-sB=vv8hD-X0WVVPzgktHuxa8A@mail.gmail.com>
Subject: Re: phandles using absolute paths in DT overlays
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     David Gibson <david@gibson.dropbear.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
Message-ID: <20181211081659.gBlhje2UKsWYwSj2oH53NbthbdscatYZzrwvMOMD0Ek@z>

Hi Frank,

On Mon, Dec 10, 2018 at 11:10 PM Frank Rowand <frowand.list@gmail.com> wrote:
> On 12/9/18 9:49 PM, David Gibson wrote:
> > On Fri, Dec 07, 2018 at 09:19:24AM +0100, Geert Uytterhoeven wrote:
> >> Hi David,
> >>
> >> Thanks for your answer!
> >>
> >> On Fri, Dec 7, 2018 at 2:44 AM David Gibson <david@gibson.dropbear.id.au> wrote:
> >>> On Thu, Dec 06, 2018 at 01:56:45PM +0100, Geert Uytterhoeven wrote:
> >>>> Some early revisions of SoCs may have hardware bugs that need to be
> >>>> fixed up in DT.  Currently we are handling this by including DTS files
> >>>> and fixing up nodes and properties, to create different DTB files for
> >>>> different SoC revisons (see arch/arm64/boot/dts/renesas/*es1*).
> >>>>
> >>>> As an alternative, I'm envisioning the use of DT overlays and the
> >>>> fdtoverlay tool, in the hope of simplifying the generation of DTBs for
> >>>> the various SoC/board combinations.
> >>>>
> >>>> Ideally, such DTBs would not contain symbols, to avoid inflating DTB
> >>>> size.  Hence if fixup overlays would not contain symbolic references,
> >>>> there would be no need for symbols.
> >>>>
> >>>> For anchors, the "&{/path/to/node@address}" syntax is working fine.
> >>>> For phandles, while documented on
> >>>> https://elinux.org/Device_Tree_Mysteries, and while working fine for the
> >>>> non-overlay case, dtc seems to have issues interpreting the DTB:
>
> < snip >
>
> I have updated elinux.org with the limitation for overlays that you report
> and that David explained.

Thanks, LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
