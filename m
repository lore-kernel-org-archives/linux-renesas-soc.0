Return-Path: <SRS0=dpDL=QG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBFEC282D7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 16:56:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5431A2086C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 16:56:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730990AbfA3Q4B (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jan 2019 11:56:01 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:40378 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729299AbfA3Q4B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jan 2019 11:56:01 -0500
Received: by mail-qt1-f194.google.com with SMTP id k12so240689qtf.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Jan 2019 08:56:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H4c+fzEjWSqodPtPdwOq0Jl4jiAhWYR/qIasiDYwzgU=;
        b=E2fasNDuW9QuM61s3y/AdpLBkJ6UQkpbwWX+vAY1psvNaFQp7Cr7haQVfCOwPIZD4w
         AFcPiZfJ3Pk6qJlgHBI1wwPeAXMfI60ny2SQCf89lbLJAlQwGNSsyingjvMjtB4Po+1f
         4dVS6Vd4HO9JqxphTaV6DDzGwpxBKV7FgKhrOy0CsRoJckfrr2HxyVGDMo3dV49a8ZSo
         fVhMnQZi8IDto763U2YzcpMxtbTx930p0HgsrYwzeqL2IxpiBKIO84eYM9mjNJdyWtjE
         ENvkA8y/YjgGGY6SlisIdKNOblfLTKcslrbpPjrX0zAZ74lohG/Z9a8ejT+d7rjJVSNK
         ZuIA==
X-Gm-Message-State: AJcUuke8vgInH70QjegQdPt6bBkGDejP6Z3hFGWHUeHDOiDV2WvDoH6z
        cfYdlrx3a3WXxK6THV1/oVyG4yzpCA5vvoURVQKJIQ==
X-Google-Smtp-Source: ALg8bN7l4KKjN+8fLSRfG7JJPUxK2m28Ma8DVQMfnroaor2HFON91xE5J7c6oMaK7G8iXrOGQCfBHJQWc+IqYd3fwFI=
X-Received: by 2002:ac8:7451:: with SMTP id h17mr30185189qtr.319.1548867360651;
 Wed, 30 Jan 2019 08:56:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1548233325.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 30 Jan 2019 17:55:44 +0100
Message-ID: <CAK8P3a0BxWZ=PWG4-m5a_XojKcFqVkrk1aoK6MyoNKhmZpa--g@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v5.1
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

On Thu, Jan 24, 2019 at 4:12 PM Simon Horman <horms+renesas@verge.net.au> wrote:
>
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these Renesas ARM64 based SoC DT updates for v5.1.
>
> I am sending this pull-request now as a number of patches
> have accumulated in this branch. I expect to send a follow-up
> pull-request closer to the usual rc6 timing.

Pulled into arm/dt, thanks for sending these early!

      Arnd
