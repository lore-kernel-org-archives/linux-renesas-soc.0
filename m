Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7A4C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 08:35:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78FD120883
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 08:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727371AbfARIfK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 03:35:10 -0500
Received: from mail-vs1-f54.google.com ([209.85.217.54]:46003 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfARIfJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 03:35:09 -0500
Received: by mail-vs1-f54.google.com with SMTP id x28so7907256vsh.12;
        Fri, 18 Jan 2019 00:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XqpRB74ajx/csnpDcuG9Nhf0T0Wy58ERqxDBtWJqRIY=;
        b=kQyj+WTaHdyR/EBHvnZJrfHqhKAleJYh0RNujnLEVHxH0115WZaZa5dzsRBkowkRWg
         /gvzo0g+FDTrACd2JqAlp8pT+uyOf337yL5oFlZrOEiFEOl9Ur3lQLhErUrr3deBk6cc
         Uk4FUp4aicZCRC+s1ye1WpUkbYMjmJ2nk4sYu6PWvonutqRIVK41z9xzt9PJIKKXwtZg
         1rDv8FY2SkEIUpUFddrt3JqfpKYQaz/AjgTULSj22EDtPOmmrPPDPa0fTAYtHV+PZ4ZX
         aZ+YO0xbjXnkxVR3bCG658OFUF3fkyvUgO6eWSAYkbGYWUHldl3Y8h66PftBGKipvGNv
         +LFg==
X-Gm-Message-State: AJcUukda6qCcrab6VElRRtFX+r6pYJg4lCMnoq2FLYvmsj11pyBahc2N
        QghuJFW1gCH8GO0CE1HQpHECnkOZCUl6H4U2R4e+Lw==
X-Google-Smtp-Source: ALg8bN5TOc98PxASnqiZY89wAtLUiX8jHsbBffkY3L9NUKJpWIsP1HVvePXmwkBbq0ZblDqlkGeXpQi0B+VCHvaBbQ0=
X-Received: by 2002:a67:c202:: with SMTP id i2mr7179863vsj.11.1547800508059;
 Fri, 18 Jan 2019 00:35:08 -0800 (PST)
MIME-Version: 1.0
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
 <20190116210555.12209-8-wsa+renesas@sang-engineering.com> <CAMuHMdVj49y3b+WqyTfNV2sc0WTneFaO4zZSA6WfkZDrqgD=eA@mail.gmail.com>
 <20190117170553.GA2516@kunai>
In-Reply-To: <20190117170553.GA2516@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jan 2019 09:34:56 +0100
Message-ID: <CAMuHMdXn3u44CM9=E79v4BHdDbgg=wz1i4mV0Ws8eC+RxjWgVQ@mail.gmail.com>
Subject: Re: [RFC/RFT 7/7] i2c: sh_mobile: update copyright and comments
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Jan 17, 2019 at 6:05 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > + * Copyright (C) 2014-19 Renesas Electronics Corporation
> >
> > Why this addition?
>
> Because of the funding. Is it wrong?

That depends on your contract ;-)

IANAL, but I believe that by default:
  - work done by an employee, is copyrighted by the employer,
  - work done by an independent contractor, is copyrighted by the contractor.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
