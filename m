Return-Path: <SRS0=NmnW=QW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2B9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 15:50:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 369CD2192D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 15:50:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731152AbfBOPu0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Feb 2019 10:50:26 -0500
Received: from mail-qt1-f170.google.com ([209.85.160.170]:34401 "EHLO
        mail-qt1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbfBOPuZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Feb 2019 10:50:25 -0500
Received: by mail-qt1-f170.google.com with SMTP id w4so11404477qtc.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Feb 2019 07:50:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3jjcovRATW7oFSOOb7YSAwHoKQTBOoYX2rkYv5yEL6k=;
        b=o8a1ilYmFG1DlePY5pTL97Wl8fJ6C7eljDs7cuBxMSZyZmfBhxOSeYtP/6lBgF3FsN
         Lj6iC7GkZHD4O77N3JkRoHdRW4pO66l7leLtFuHtGmHWc7uh/65tXr9P/pq24v2Kr9gE
         W/Y3zfpx8KzJeotApEqeRR7n2pwS4XezRJbtU8ZsakzGGqixapM36+kTNTtmo4pm3Gjs
         I7zwwTR8RgJgMP8ZZutjyJGMQEYlISuUuFQJrxCnrCciJfVzZh8lGTe3OeTnvx/z/POL
         TZiRmJqexVxSJiyxKKbIMt+v/HXrnAn/1brU2zeewN/ly+LPYqpDQ7iyMRvTX/BmpUxK
         vgyQ==
X-Gm-Message-State: AHQUAubYPNBcFZGkHaNoFHx+Rlcs24UwwG8aCUzJJMTuQhW29FUX+iUt
        OUPZkAZU31lK8im+KjfOY8fUdNicu3IyB2+7Tok=
X-Google-Smtp-Source: AHgI3IagGMt0QlTaqTlzBmXqGF6cVuumFitsSSr96C3639zb8YG6/StMYZWAqb++sOIxSOjJNpDkHBPaJ/i5Ntp4ePU=
X-Received: by 2002:ac8:33f1:: with SMTP id d46mr7935016qtb.319.1550245824733;
 Fri, 15 Feb 2019 07:50:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549621233.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1549621233.git.horms+renesas@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 15 Feb 2019 16:50:08 +0100
Message-ID: <CAK8P3a2+iY5YKO9__-dU+BMbip5nDgA5KEenZSN5LdednhvsDA@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v5.1
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

On Fri, Feb 8, 2019 at 12:13 PM Simon Horman <horms+renesas@verge.net.au> wrote:

> ----------------------------------------------------------------
> Renesas ARM Based SoC Defconfig Updates for v5.1
>
> shmobile and multi_v7 defconfig
> * Enable support for recently upstreamed RZ/A2 (r7s9210) SoC
> * Enable NXP pcf85363 RTC which is used on RZ/G1C (r8a77470) based iWave SBC
>
> shmobile defconfig
> * Refresh for changes present in v5.0-rc1

Pulled into arm/defconfig, thanks!

      Arnd
