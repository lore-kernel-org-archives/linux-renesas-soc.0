Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7FDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:13:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74ED52145D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388040AbeLQQN4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:13:56 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:36366 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387739AbeLQQNz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:13:55 -0500
Received: by mail-vk1-f194.google.com with SMTP id 185so1283769vkc.3;
        Mon, 17 Dec 2018 08:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vRj0WEWGpoArRoONLRxzg+MlIuNdv6og4bzFU1xddtY=;
        b=omsaF7UEV2PHO8WAZWplzgYEsVfTwGxz47ARfUNw024HftuJK8CEgY2mHbxmqZA955
         +0AI/kiKaMzCnxQvxkvUyg4abbgxlW2cfA3cqB2ExgulJC7Ayp9SRYyt8Tx5BaW5+CUN
         a+vijA49iCXlakiQptYpgXuG0A7BOslecDYfsxULzhu/Z4WP7hRuPNmVrZlIe7ftHCs7
         K7HaACLvUvDCUhRSuZMl4Gc4j5vER26FmWeEEDjMia6VoAcI9WBTNvGnqHLREY0CuPs6
         bF3+Bo45om2YJ7GrpVf+i5IVyjhkBR1tqU384yH2Ir8SUqNIXpq6Ywo9cufoE2P3zTlM
         RO2g==
X-Gm-Message-State: AA+aEWZ9comTeEP3QBDS8JD77lPzv7i0URfGH3Zn3YhE0WAzDh8oTIWp
        /+FRSGeQODvUSD5Q/+P1Xr8EZqHBpD0P9zWcQP7IsTQAHYE=
X-Google-Smtp-Source: AFSGD/XVOVeIhy7qnLmnk4tM4O83wvFPDtle5UN2uzZ3k3aFC5PR27ydDvuVmaxkcOEN0O/qJjIcsBSE1WMPx1UnJYc=
X-Received: by 2002:a1f:298e:: with SMTP id p136mr3873696vkp.40.1545063233863;
 Mon, 17 Dec 2018 08:13:53 -0800 (PST)
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-6-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-6-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 17:13:41 +0100
Message-ID: <CAMuHMdWrHq5sKo_jej0Z5vQC+d3vjpbvTjX0nHZV1_JBT4+WXg@mail.gmail.com>
Subject: Re: [PATCH 05/17] arm64: dts: renesas: r8a774c0: Add thermal support
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 10:38 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds the thermal device node and the thermal-zones
> node to the SoC specific dtsi for the RZ/G2E.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
