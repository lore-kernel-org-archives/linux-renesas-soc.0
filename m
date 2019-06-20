Return-Path: <SRS0=UbMS=UT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0869AC43613
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Jun 2019 14:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D23B72083B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Jun 2019 14:33:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfFTOdH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Jun 2019 10:33:07 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37683 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbfFTOdH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jun 2019 10:33:07 -0400
Received: by mail-lf1-f68.google.com with SMTP id d11so2614694lfb.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2019 07:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H+GCMVzS4QTtPnP/HGO7wObTG2xSMv2/zVK2lsZJ/so=;
        b=GuLOz+mevMcPaYnctmHBELcLpKLc4WifoXZ+yqlR7X/BHt/Cc40tesEQLUqsI0qmn6
         sHtCwidXBy6TMedVXh8Ld85nDBqVvgJqtSRL7HmJssGSW8aqDj42yJpBb1LA+Ii69k9k
         VPUaUaPEzUZKtHDmifxvKz3iSEeMq7d+LzYmjr1ArSrXPesDX98egGJ3e/SreaayUfzV
         eipTq+4LBqlEguxjncYWmXPCytiLEN7mVQG3VsjAAI4CM64vq8uCswp4zru9t4Oaadpz
         IwggmTPo8wg+KJc0d7UwBKQF8C+ykGNE5opdzvWech/YrjMtQeLZabUsZQoRuBIKA6O0
         WLFw==
X-Gm-Message-State: APjAAAWglKXU3iClbk7poVyhcsRotJJTtc/5pYv7ZBfBEyfmMmihglDi
        9G2RYyKS0qXs/FlvIvBpZc5yGdb1lW0dAsJM3/9yeg==
X-Google-Smtp-Source: APXvYqxYoXR/tfndrElu8PpUexrQSA0NFGKnf1IJLG/LBGU9Da56D+oqFGjTL3YU1WRb2PdVjTMXgONzSB8ANho6p1U=
X-Received: by 2002:a19:6e41:: with SMTP id q1mr58168110lfk.20.1561041185642;
 Thu, 20 Jun 2019 07:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190620142325.28806-1-chris.paterson2@renesas.com>
In-Reply-To: <20190620142325.28806-1-chris.paterson2@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Jun 2019 16:32:38 +0200
Message-ID: <CAMuHMdXUq=G0JEBvYk98RpzpHJHZqdbbVwAqTT5Ntr0kikOCNQ@mail.gmail.com>
Subject: Re: [PATCH LOCAL] arm64: dts: renesas: r8a774a1: Remove dummy board DTS
To:     Chris Paterson <chris.paterson2@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 20, 2019 at 4:23 PM Chris Paterson
<chris.paterson2@renesas.com> wrote:
> This dummy dts file is no longer required as we have a real board, the
> r8a774a1-hihope-rzg2m.
>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
