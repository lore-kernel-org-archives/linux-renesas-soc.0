Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832CDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 13:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E1862085A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 13:45:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTox5pHH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbfCSNp3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 09:45:29 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41866 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfCSNp3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 09:45:29 -0400
Received: by mail-wr1-f68.google.com with SMTP id p1so21188256wrs.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2019 06:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xzr5MV0iIeH5RuRMPXWLZfYUnEvkepSd6XYNRHK2H4g=;
        b=bTox5pHH0P3TirHjMRAjo5xzgFmjfQ5XPjo5sjlyNgOoxbU5MbGvGJg7zspUs3d9tG
         BwlpiccZnxHFC2Q4YOL7WF1m8oNTZ+QFBIaNWo4gGEiHzVFy5+AeDmgXpVHrG/EcLE49
         bhOyuPpL+irwG+ZX9wzIFdQQ92avlHJ3etlc9njbz8cMKdPYfG6Paa+PODH26oLaXed7
         SNQDhxC6maqAOjHYH4b4JA9I61VcZNU1Zzl2KqQM1ZpAksuYtEdX0j41tFv5kNFdKNK9
         rNseDZqUeotm9tahhX8TNdJLSIAfalo+KZDW4kSCz1otO6h79s3ZWe/k8SCyhd3nlcXH
         Sh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xzr5MV0iIeH5RuRMPXWLZfYUnEvkepSd6XYNRHK2H4g=;
        b=DHsSCmKAVoliDyGkX0F5v8KSegJ0RbfcmIb7HrkxlBWhDYnMwmUa5SavAoqLH+dLB0
         K8gQtXkl7zImVMYego8LoFtbpKoI/e+X+EKgx4p3XS30dGTpPRaqbVJjOY5DDRZsJsz9
         YpBu2Ax7JqCrTMAzVR+TsZHWS4RNvdjRSsHJR38oCzbj62zvLjnH7yoNcOeoDjxFQQKW
         X1UhB4eXuOGWigAI/PQjOYFkOdxkbjqsFYhNXySpeGQMhe4fI2c9f7lx6IUM5it91OuC
         iVmEow+FK4cDGPW/lCWzTqVTRoyS5oscyq2Augq0J/I3itCT8wx7wDQCikv4nP4pixzd
         eMsQ==
X-Gm-Message-State: APjAAAUNVypb5wy+0plV02ETLJFu9omJ/Oapk7aotSVZ2QGaxX0mOUVN
        CQagpr7KEEE9ao4qAHZ9nf9eb7ZnzIAboui8u2Q3jHIt
X-Google-Smtp-Source: APXvYqxb58A0TDdvIGetwLB7VDKw8sLd3weS8oGacUJej/rimxsVFKz2AiOhLb/h56oLMXmGoCJ3Gyh3kRYXZhbw6X0=
X-Received: by 2002:adf:f14f:: with SMTP id y15mr17891262wro.223.1553003127861;
 Tue, 19 Mar 2019 06:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <155067454871.15971.12157033067057246708.sendpatchset@octo>
 <155067455863.15971.400236990712480655.sendpatchset@octo> <CAMuHMdU0ncCg7MXS7XTmiDX42bXE0Wj6RLvd0GddNA3R+Bawaw@mail.gmail.com>
In-Reply-To: <CAMuHMdU0ncCg7MXS7XTmiDX42bXE0Wj6RLvd0GddNA3R+Bawaw@mail.gmail.com>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Tue, 19 Mar 2019 22:45:15 +0900
Message-ID: <CANqRtoST3OGJMuYfz5ox79eCtOnBgyXp=P6byGa4tx_aSjKDPA@mail.gmail.com>
Subject: Re: [PATCH/RFC 01/09] iommu/ipmmu-vmsa: Disable IPMMU when address
 expansion is not needed
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,
On Thu, Feb 21, 2019 at 1:10 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Magnus,
>
> On Wed, Feb 20, 2019 at 3:55 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Add a memory bank location check to the whitelist handling.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> Thanks for your patch!

Thanks for feedback!

> > --- 0001/drivers/iommu/ipmmu-vmsa.c
> > +++ work/drivers/iommu/ipmmu-vmsa.c     2019-02-20 22:59:28.589893396 +0900
>
> > @@ -797,6 +798,12 @@ static bool ipmmu_slave_whitelist(struct
> >         if (!soc_device_match(soc_rcar_gen3_whitelist))
> >                 return false;
> >
> > +       /* In case all system memory fits within 32 bits of physical space
> > +        * then assume the IPMMU will not be needed for address expansion.
> > +        */
> > +       if (memblock_end_of_DRAM() <= SZ_4G)
>
> Can this give a compiler warning on arm32 when CONFIG_ARM_LPAE=n?

Not sure how, can you elaborate?

To test this I actually installed a new arm32 compiler but I failed to
trigger any warnings.

Thanks,

/ magnus
