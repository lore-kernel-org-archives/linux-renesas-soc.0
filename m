Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A623CC43218
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 03:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6767520675
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 03:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1KUHWHv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfDZDxL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Apr 2019 23:53:11 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46738 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbfDZDxL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Apr 2019 23:53:11 -0400
Received: by mail-ot1-f66.google.com with SMTP id s24so1440507otk.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Apr 2019 20:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q5/spNp1pdGDExWy+KIIXkiknxrtMiTvxnGB9BSCPDQ=;
        b=c1KUHWHvaqU9XO7ddojHijLlMBvjQ+xOyUXc3Ncrw5YDKalDKTTn/opktSYwu41FvO
         2hnMmQ0wrtOxZvLsgFajj7yY6o8ESWRPjjdtQprEju7PvYZ9rExtGdKX4fuHuIVcLJX/
         z3N898s/ncYmeIeUUufVx8nWuDQ92MiacJKaDsK2IjKI/ReMC8GP7jH+X/JdVO7JdzGz
         hR4qfXoeHDVnJrfQR4V1NsO+fhc6PyypsEMYCZC3SWgzkefoJ4AnAyW1bUBzm2ZhhIUW
         RIbZdQKwhbtGcv4efHSEsvZSXcIrFE1ngkHMjidB14P5H5wmiIPBhmjpmLRPtGEgonwQ
         UWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q5/spNp1pdGDExWy+KIIXkiknxrtMiTvxnGB9BSCPDQ=;
        b=BqX5qUtDcIGva1FA8P6T6kKVU/fOJtv4LtHD4IoVCAboiUHwX2t8icsPB/OgXcUzt1
         uBNy/io7eQIlViILP3iBkbMk697ApMQ0rgAX8rcKFF1de0rWQEbMD3yl3hnND2niy9wB
         l3dSIq8lUZ2kvPRErpG88tovJXJk64haE+BHvxGOI/x8FqvQSAFIjUO9qznHPORKzB+c
         tqxvT+lfhr7gM6p1sBDmIXGoRwUloiiULVNeFh/vKy0EgDsgKyGof8UQnc3GOVSIahUB
         P0ZqDjyQNZ0l8P2musiNaL8P0RgEcCF9jhS+4QPt+vr2w4nJDpqY3a556cGl6bproQWw
         Xf3g==
X-Gm-Message-State: APjAAAVMUpDdyyomjoNKOVRZ5FWwnfNBA3TvORfDdMFFMa2KTHXZhjm6
        H0hzuc0t3h2G+QJmHdtWyrb931Xk1KfyIfej3RzBEA==
X-Google-Smtp-Source: APXvYqxxwdYT/ykUyaGbLdAFuLvFrHCDEfEdWlN/qrQmpdztzf3KG3K8qfAVju3Z9FXKTSRYhVxeyKdmzflnskXXCMY=
X-Received: by 2002:a05:6830:15d4:: with SMTP id j20mr21161662otr.367.1556250790589;
 Thu, 25 Apr 2019 20:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190425143555.29659-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190425143555.29659-1-wsa+renesas@sang-engineering.com>
From:   =?UTF-8?Q?H=C3=A5vard_Skinnemoen?= <hskinnemoen@gmail.com>
Date:   Thu, 25 Apr 2019 20:52:58 -0700
Message-ID: <CACiLriS7C7D4XRjvrspLjU7VbSLioSxcnvHnQPS5xbEHZBWXEA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: friendly takeover of i2c-gpio driver
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Haavard Skinnemoen <hskinnemoen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Thu, Apr 25, 2019 at 7:36 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> I haven't heard from Haavard in years despite putting him to the CC list for
> i2c-gpio related mails. Since I was doing the work on this driver for a while
> now, let me take official maintainership, so it will be more clear to users.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
> ---
>
> Haavard: please let me know if you agree to this patch, or want some more
> discussion about it.

No objections from me. Thanks a lot for keeping this driver in good shape!

Acked-by: Haavard Skinnemoen <hskinnemoen@gmail.com>
