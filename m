Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602A6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 16:36:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 306B021773
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 16:36:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbeLTQgv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 11:36:51 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:42717 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbeLTQgv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 11:36:51 -0500
Received: by mail-qk1-f196.google.com with SMTP id 68so1343709qke.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Dec 2018 08:36:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hhWZ40mjnDjSNil82Gh7Oaa45EcoXgQnyH4Tvgg+uzI=;
        b=c2XCdR/wRCobZQ878slYtj647iAEaYLmkzMiVzlFQEkb3gjOGAEPYmuHDfNXNhmoN9
         U1Fh/kBIKZAeparaZPeRNXFk3VtbdO+wSmDXVXWvDKYHR989fto2OBSmXynRd8++YnX4
         5DBvGQOGpRBzF0g/SA9E5dfDRaNvfDDzw0Vc4aXB0hXfnbyLdwX+32/tdOnOcrkXz3di
         wo8/Z7NilPYYkZ/g96W2H0EaBm5qZ/0q7AmEQSJ2hjco3x7i/pEvIg2waTQbd1SZAXWk
         TQ94+OAbJXLNwxlaMwJb/TgXJqqB2tMJf8zk6eOvMlCMg2hGjaHfcLrJE+n6wcT+uFEe
         7VNA==
X-Gm-Message-State: AA+aEWZh0mpJqKH7vYoZIEq+AtA4MmQqK3+acMQMU47TedIOqAjEh+Zr
        0F9XeVNJ/baJM74FmZsZOsIyH8a9izwmS3dDFXQ=
X-Google-Smtp-Source: AFSGD/VU5Gjyelqh1kUFpYNWv3fG6G/JX+Wq39OG/9/r4dJdwQqJ+kvpT0XL0qK5bpU0bq4cJ8FJL81xbE/RAh9Y34U=
X-Received: by 2002:ae9:e102:: with SMTP id g2mr23823298qkm.343.1545323810748;
 Thu, 20 Dec 2018 08:36:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1544705534.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544705534.git.horms+renesas@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 20 Dec 2018 17:36:33 +0100
Message-ID: <CAK8P3a3b=H88epScZ14Rk-Q9kni_OmueOtohUo7L7N_+P8uYpg@mail.gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC Fixes for v4.20
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

On Fri, Dec 14, 2018 at 12:57 PM Simon Horman
<horms+renesas@verge.net.au> wrote:
>
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these second round of Renesas ARM based SoC fixes for v4.20.
>
> This pull request is based on the previous round of
> such requests, tagged as renesas-fixes-for-v4.20,
> which you have already accepted.

Pulled into fixes, thanks!

     Arnd
