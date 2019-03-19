Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27A1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 13:45:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 943F22085A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 13:45:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfCSNpj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 09:45:39 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:43364 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfCSNpj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 09:45:39 -0400
Received: by mail-vs1-f66.google.com with SMTP id i207so3192159vsd.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2019 06:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sF7VKE01MNfC3kpAKZvVMU1reRoBo78Nu7fiRHko2rg=;
        b=i23NOYBMglso9V0iNoyvZJhmt6Yh7vttZu1cp0iO25sWADYB3Xhhr3gOp/zHy476qy
         OrBzyVclnJov/MK+tQaLfM+qLvGV6n4C1rXPpbZlX19A4HTQgkCY7fMr6R9zW6efMstn
         BVYF1nGSfad2e4i6AcTNAxQzR0ZpqhXMn5e1c8A958UKA7tLj5j7ATAG3BhBz2ZmiK6d
         JZoqXpfFj5KCDLmz5UpZCZxqGFy4zn5ES3AlUgEvREvZv2ikbUMlqxuJJ+sCzj2Vzw8z
         Mal2HVWLZxskCLRFibASg0DTlqwAmHrA4MY8MAg0T47f40o3wEPjfRd3ekTtlWFB5Nzj
         qoLg==
X-Gm-Message-State: APjAAAVn8DvCbo7lusvsuhOjE3auaqaNu8N2U9ljfTkG+ud6d/5775gM
        3GlfK2x5CVbweyrWmD9qZfIv4fnaQO0t6YvWQYg=
X-Google-Smtp-Source: APXvYqxhvDr7SeFeirrEjFwxWZvYEe17G5zrpcwfKlDoLjGapn+mh/BEnga0cxe/t4VQbD1SuhTT9ikuWG0Ue16LuAk=
X-Received: by 2002:a67:f843:: with SMTP id b3mr1350488vsp.152.1553003138282;
 Tue, 19 Mar 2019 06:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <155300296860.12646.3763135168702689012.sendpatchset@octo>
In-Reply-To: <155300296860.12646.3763135168702689012.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Mar 2019 14:45:26 +0100
Message-ID: <CAMuHMdXNFNjLekL76vw4PTyNFiqqYNzuVOKXkOF67BGysuwx0w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Update Ebisu and Draak bootargs
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 19, 2019 at 2:41 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Update Ebisu and Draak bootargs to match other boards
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
