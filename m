Return-Path: <SRS0=tR/q=R4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE117C10F03
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 16:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CC1C20879
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 16:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbfCYQD3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Mar 2019 12:03:29 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36504 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfCYQD3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Mar 2019 12:03:29 -0400
Received: by mail-qk1-f196.google.com with SMTP id k130so5647112qke.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Mar 2019 09:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HWNDjk/lFxVKJSLF00UpkWf6N5KC/sGQJGl9BvrKbZM=;
        b=hSWphMZktaCttFlf795TdGBRWxQsIqoDHCeGTsbdhAl+02CqYddCvOv/cXAYxKMuXS
         +9+lFIEMEzBWQ6wRKny1GMK6/oBxkyNPwFNy/h7mPMX8SD7+3SVgzjog2oxUWzUnZjjc
         OKIn29RjtE8lexbhGrdHDg8j5b4WNFSr+kPuBWsYZepZd2DuZ5+tjqelE0WSwB+cQZgq
         xWvR5wJOVyDoq+OwDh4rc/cUkNppFz43BMogtIntT7BaB3mlOQ56oS85zNP/6YffOsKA
         e6Wmj+lXSAs8tSCSJ+jAQUNvy/OwIpD5ar/qbe0f1+qZp1hZUAAZsC2p7Uz90viOEa44
         VwEg==
X-Gm-Message-State: APjAAAVTaaAezIaSyYBH6jfU/FZBsGxGGglo8WKVR+Zi1zvdK0Ia89XP
        MOd3p803cTkkfsWrWgRZCNkf/6nYM7+YTBnGfetQGw==
X-Google-Smtp-Source: APXvYqxPHVwmO48MvIrxsyIfEC+mA7NCZng69eyajie5+gAkXUohQsPX28jkU3fXUILCouooP5LKepQjv4L4dYFQK0U=
X-Received: by 2002:a05:620a:153b:: with SMTP id n27mr18490892qkk.343.1553529808196;
 Mon, 25 Mar 2019 09:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1552644639.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1552644639.git.horms+renesas@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 25 Mar 2019 17:03:11 +0100
Message-ID: <CAK8P3a2FRQX1b_UXyD-ipJiY8wjqEaU+eHS_7A9cy7-ZWE7u+A@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Fixes for v5.1
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 15, 2019 at 11:14 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
>
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these Renesas ARM based SoC fixes for v5.1.
>
> This pull request is based on
> "[GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v5.1",
> which was taged as renesas-arm64-dt-for-v5.1 and you have already pulled.
>
> The reason for this base is that the fix for RZ/G2E (r8a774c0) resolves a
> problem introduced in ARM64 Based SoC DT Updates for v5.1.
>
> The fix for E3 (r8a77990) resolves a problem introduced in v5.0.

Pulled into fixes, thanks!

      Arnd
