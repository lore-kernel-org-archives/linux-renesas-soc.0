Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE79C5519F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 17 Nov 2020 12:28:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 719422223C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 17 Nov 2020 12:28:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3qYIq8+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgKQM2B (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 17 Nov 2020 07:28:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:42812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbgKQM2B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 07:28:01 -0500
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62B3E2222A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 12:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605616080;
        bh=ej9J0qo3ysNq/21NEgELxp1O2dCTyqrJrNS0laPUhZQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=o3qYIq8+1KVqyXnUBayCFH3SRH45zNDCW8RmWLLGY5b2FVU38bctYa1BHUV/6DBOX
         3TwXXIyfQRJxkg7Gmy66sU+KqaOZLaaFR61KTbam7deCWTLViN7AdGalfQO8NKMRvF
         ptqFa15oUk4IZ56VZWRMH5bAtMCv9yFkSk5w9CZc=
Received: by mail-oo1-f45.google.com with SMTP id r11so4678340oos.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 04:28:00 -0800 (PST)
X-Gm-Message-State: AOAM5335lbRGYjZe6sqHiFXz9/Dqcpn5ZO0srf33kmtD2F/O58cxMvPz
        whB/JeGo6OsfWN2Cfl8kbZ7laV/7nAshgFes1kw=
X-Google-Smtp-Source: ABdhPJyy3IMo1a1aBWbE9ceYNhPLsbuUnZctCgavipBieLRxBtehRlesRGGxHh7dM5Kz32T5bMZl0XiCUDa8helNkS8=
X-Received: by 2002:a4a:eac1:: with SMTP id s1mr2868140ooh.15.1605616079649;
 Tue, 17 Nov 2020 04:27:59 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
In-Reply-To: <20201117103022.2136527-1-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 17 Nov 2020 13:27:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1wanBnkNLBuEvSbJjwgF5m08K7RFUab+-q7e8c_2W3nw@mail.gmail.com>
Message-ID: <CAK8P3a1wanBnkNLBuEvSbJjwgF5m08K7RFUab+-q7e8c_2W3nw@mail.gmail.com>
Subject: Re: [PATCH 0/7] ARM: shmobile: Remove IOMEM and static mappings
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 17, 2020 at 11:30 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi all,
>
> This long-overdue patch series gets rid of the last remaining users of
> the legacy IOMEM() macro and the needed static mappings on Renesas ARM
> SoCs.
>
> Ideally, all addresses used should be obtained from DT, but given the
> maintenance status of R-Car Gen1 and SH-Mobile SoCs, it is very unlikely
> the needed DT bindings will ever be written, and the needed DT nodes
> will ever be added.
>
> This has been tested on r8a7778/bockw, r8a7779/marzen, and sh73a0/kzm9g.
> I plan to queue this series in renesas-devel for v5.11.
>
> Thanks for your comments!

Nice cleanup! I looked over the patches and only had one comment,
but the same comment also applies to some of the other files.

As far as I can tell, the this in fact removes all the __raw_ MMIO
accessors in mach-shmobile.

     Arnd
