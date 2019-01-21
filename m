Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF134C7112F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 11:53:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86FE82089F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 11:53:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbfAULxD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 06:53:03 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:40148 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728024AbfAULxD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 06:53:03 -0500
Received: by mail-vs1-f67.google.com with SMTP id z3so12427895vsf.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 03:53:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T47vHaxOgL1RuXFA7/wi/lsKC6VwSUg+maL6SaJF360=;
        b=NqZ4yQjwXbhwPOOXPxLMOZneEit4LWQBgPNXzcuLlMVPaOvAf/R8ose1+C6t4Q4gxF
         Sza8n09FUIO4oPYgK7Kf8i0KaKHlV66bWFLf/4j8NBy8D/xIOlTk81I59zFu4KMX1TCx
         becdJ2fYLqPLOG5yX/ICMpH6fyLFRirOtr0vsw1pNDsGhhu539SATAccH1NOr1wj+nt3
         VCsxDECAywsldSsPa7gUaTLguK/83jcbGjgZ7t+XfjrkypRDZ08gyg/cDzS9k0fRga2K
         xiZhaR5KOGEJNRfNnh2sbAzSk5CibtBtdW0rZb04GFISr3L7yuLnzkPqtkeWNgrRsirG
         Bq+g==
X-Gm-Message-State: AJcUukfKRw7RgYkIKB9BpY2hOEJics9+MpiltOlRIilXY5BSBVlxpNSq
        Yr/8FUv4l+LZRJvcoYBPXtLmHKa9laoTo5W2iNs=
X-Google-Smtp-Source: ALg8bN5S6NtIMwkFyjHRcUfRLhd+BJCizmtAKBLGeft8snr6HZNk1BpInNtgT15XAKZVyvQz8qZMFaLKIqzmAzS+EwI=
X-Received: by 2002:a67:c202:: with SMTP id i2mr11720050vsj.11.1548071582210;
 Mon, 21 Jan 2019 03:53:02 -0800 (PST)
MIME-Version: 1.0
References: <154807139502.25511.1919986589060151108.sendpatchset@octo>
In-Reply-To: <154807139502.25511.1919986589060151108.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jan 2019 12:52:50 +0100
Message-ID: <CAMuHMdUe+Hjn7cJB19OpEt7=Stcj-=gvA1TxH-fEjDpTx1PG1g@mail.gmail.com>
Subject: Re: [PATCH/RFC 00/02] Remove undocumented IMR-LX4 device nodes
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Konstantin Kozhevnikov 
        <Konstantin.Kozhevnikov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Mon, Jan 21, 2019 at 12:49 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> Remove undocumented IMR-LX4 device nodes
>
> [PATCH/RFC 01/02] arm64: dts: renesas: r8a7795: Remove IMR-LX4 device nodes
> [PATCH/RFC 02/02] arm64: dts: renesas: r8a7796: Remove IMR-LX4 device nodes
>
> These patches take the easy way out and simply remove the undocumented
> IMR-LX4 device nodes from the upstream tree. Good or bad, let me know!
>
> So perhaps this is a bit overly aggressive but since the DT bindings seem
> undocumented and no driver exists in upstream my gut feeling says these DT
> nodes were part of an upstreaming attempt that got suspended half-way through.
>
> In case DT binding documentation is in-flight and queued up somewhere
> (ideally together with a driver) then feel free to ignore this series.
>
> Instead of removing nodes we could also document the DT bindings for the
> IMR-LX4 devices. It would also make sense to add device nodes to other
> more recent SoCs than just H3 and M3-W. But blindly adding more DT nodes
> with a DT binding but without a driver seems a bit suboptimal compared to
> testing against an actual driver.

[PATCH v5] media: platform: Renesas IMR driver
https://lore.kernel.org/linux-renesas-soc/20170309200818.786255823@cogentembedded.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
