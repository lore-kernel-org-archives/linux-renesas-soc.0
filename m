Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48DEC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 16:39:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9BA6D21773
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 16:39:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbeLTQjD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 11:39:03 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:45748 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbeLTQjD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 11:39:03 -0500
Received: by mail-qk1-f193.google.com with SMTP id y78so1341354qka.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Dec 2018 08:39:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kfij4cGpooSWl1dptilPzHNmiFKwszwCs4MFkdZ5+Vo=;
        b=Pp71cQA37ytY16mnbu4C+tZFpd2YoAXt2m0j9WjUVKUWVjjXIGFV3r7cy5llE1EcL3
         u2G5zVk3JuJ1rim7fgbQQFxrvLR1oLqLNnIwcci1mgySkQfxb2T5Pcgejlmem7lL+Hx5
         VHE74nndItiXStAfGeEP+jLEbKPV40V8yP61ur49qONBNrXHT+1s9f+3FBd4ETe3J221
         3vpl2cQoY0Qu2Owu7M4I7rOn6owDBiHbi8Un17W9YREWGugNrRAQ28W5Si/aZMaN+4fK
         vtWNIB27RKYDTbB58tNRjJRT2jwwH7bnIWn5GJEXnCHiaOU4cB6n4aUhSbbkxQg/ngWB
         CtWQ==
X-Gm-Message-State: AA+aEWbQk60iR4PBSYImzqNFvrfyhtsEd56b2X0g6B7oE0Z+PzCnm9Yw
        /1MkYo44ZiII1oQTwYjBn6emAPfhi7W647DHkxBZKPfN
X-Google-Smtp-Source: AFSGD/V0RoSWfj7BL1tjtax6HC9vUFcGlcxJ+IaHpAphpMOm69Lsp7NzhCI6hd51l3EjmMWvRuSXw7uC0wrtZhP45FA=
X-Received: by 2002:ae9:d8c2:: with SMTP id u185mr24076383qkf.107.1545323942081;
 Thu, 20 Dec 2018 08:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20181214115647.12391-1-horms+renesas@verge.net.au> <20181218094407.hfe7aei2hmnsih5u@verge.net.au>
In-Reply-To: <20181218094407.hfe7aei2hmnsih5u@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 20 Dec 2018 17:38:45 +0100
Message-ID: <CAK8P3a36OO+qM6r0BnrjWEWU6SV4SXu63Y=3Pq0FNt=56mzJXg@mail.gmail.com>
Subject: Re: [GIT PULL v2 0/3] Renesas ARM64 Based SoC Defconfig Updates for v4.21
To:     Simon Horman <horms@verge.net.au>
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

> > ----------------------------------------------------------------
> > Renesas ARM64 Based SoC Defconfig Updates for v4.21 (v2)
> >
> > * Enable in arm64 defconfig:
> >   - Renesas R-Car Gen3 PCIe PHY driver
> >   - Renesas R-Car thermal driver
> >   - ASoC simple SCU sound card support
>
> It seems that Morimoto-san has determined that the sound card patch is not
> necessary. Rather than move to v3 for these not entirely critical changes I
> would prefer to withdraw this pull request and revisit these changes for
> v4.22 although if you do happen to pull this then I don't think any harm
> would be done.
>
> I apologise for any inconvenience this may cause.

No worries, I just dropped the pull request from my todo list for 4.21 now.

    Arnd
