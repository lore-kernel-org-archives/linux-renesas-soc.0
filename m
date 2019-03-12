Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB73C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 04:54:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58514214AE
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 04:54:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Se6vd18n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbfCLEyN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Mar 2019 00:54:13 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38569 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbfCLEyN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Mar 2019 00:54:13 -0400
Received: by mail-qt1-f194.google.com with SMTP id s1so1190890qte.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2019 21:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qK394f5AYv1OODgM21/Wj6QDEyEj3dZQNItdFh1rC7M=;
        b=Se6vd18nQir52z4nqqhvFCfRILF+48hWcEmg56hURBVDVtIFPZVWzqb9mZmcG03yUo
         Pmhoh6fyCs3+2Csp+Xmxu2SP8Ydzo/pUEBGob/4Xhu9HXbd3w5xNYP1+WJXQFSyfABaf
         uELGEUUbDaC1ubd+yNsM/PBw2cYb3+HtnznFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qK394f5AYv1OODgM21/Wj6QDEyEj3dZQNItdFh1rC7M=;
        b=BZh94N2UWtI0099kdzZclYpwBns4yeYLnlRan+Q3a0GMOWVbpZ62Ap7HJYsiz1fNXs
         jPM2733kTZgw7j/ryHTtzwN7ufphdvsqI6uAgWNMG5ILXRMeqKlGB11i25KVs6oMCIyr
         ZvAoW8DYJkIdeDNrHFe6vJR5YFHbHITkagz1vefeXrzcxxC1deRimCXH7ezplcs6MHyz
         ucfdCoDOq04f14MTfSpu+KU5bo64BklTCABw/uvkARIOSSlAFTHHPaOLJ57n6wJuvJLu
         EKpbVv0rQuQcpicJsPcAMgawscyhLYAMS8BDKbsU79jdggDbE5gAXbSFRvCdKtTMICyv
         ot4Q==
X-Gm-Message-State: APjAAAXgoADGRmqrc3RA5BWSiIhxQaQWzdenHlO+/WHoPz99IZzKYjcj
        s0SF+8nxTp8Pti5ngUEi1ci81aIAUNqgz/1Z0NSNGQ==
X-Google-Smtp-Source: APXvYqye08RkoXJEE9Lsv0Y0JXQkjkh+Mw9t0Phm3h52EYf69Vxxz/URuMEujUW+r9Ns61eosGdm5UmNecH+EUPO6+I=
X-Received: by 2002:a0c:c689:: with SMTP id d9mr9114540qvj.20.1552366452435;
 Mon, 11 Mar 2019 21:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190309105441.18472-1-wsa+renesas@sang-engineering.com>
 <CAJMQK-iDbBhD95Dweq2q8cMpJ65RCKUTzm8CLTYms6BxpqADXQ@mail.gmail.com> <20190311184630.5yqy3wf2xkhukwp5@ninjato>
In-Reply-To: <20190311184630.5yqy3wf2xkhukwp5@ninjato>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Tue, 12 Mar 2019 12:54:01 +0800
Message-ID: <CAJMQK-jPPdGO_-UK5qS1rqt0=Xg7RneLvyKApY3EFd33OPnSaw@mail.gmail.com>
Subject: Re: [PATCH] i2c: add extra check to safe DMA buffer helper
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 12, 2019 at 2:46 AM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > How about also printing some warning if threshold is zero? Since
>
> Hmm, not a warning because a user of a kernel can't do much about it. A
> debug might make sense; it is for developers and will be compiled away
> for production use.
>
> > caller might expect that if msg->len >= threshold, they will get valid
> > pointer. But they will get valid pointer if (msg->len, threshold) is
> > (>0, 0) and NULL if (=0, 0). So warn them that the threshold is bogus.
>
> Well, callers should always check for NULL because a valid pointer can
> not be guaranteed (ENOMEM case). And I still don't get why would you
> want a valid DMA-able pointer if the msg length is 0?

Yes. But I think the debug message here is just to tell caller that
threshold == 0 might not make sense. For threshold > 0, msg->len >=
threshold returns valid. But it's not the case when threshold is 0.
Also, threshold is 0 and 1 behaves the same: msg->len == 0 returns
NULL, msg->len > 0 returns valid.

>
> Thanks!
>
> -----BEGIN PGP SIGNATURE-----
>
> iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyGrQIACgkQFA3kzBSg
> Kbb61Q//XZoT6dJYvO2WdyhYQf2Zpb4S1JEwSkMxa1XRQmw4caIdOLyJVt+OPzFo
> 6Swbg0GQbFPV0tagj9VRTTWWTA6biRf69t+d5fNCMFWJ4Rx89CuJvy1EOA6A8LHN
> Ckce/8HUXJAFdIaMwlkCagwepfO3WJ7GYDrGxiOM9e8cCOGkNgw/bXe3Xks2rcgC
> 8eFiUGqDrrG3LwsTlqBfjBC1aErwYgC/QBO0uhWiodkszggEV8T1D9ykbfTSOvCr
> LHZro3jzmR8E+K1zsujXuP2eDAhaN5V1s7VNI2mrzsQcxl/v7YKd17Us5Iqzq/1d
> 4Ynv0gr7kTLoq5wOv5gamESXQ+m8PBmU7gikrIBh7ie0HXXyQY1U7sO5iSwBoMwC
> eMegBAK8IDr5qM2YAb+urQQ/w7NdA731cYpm0+srfVSsxdpCvWJSROXHjRcrBzkm
> xkw9fY0s5l5hWzWtjrOocYVd68MOmj6hnVFW6n9itAuRsi7CZJ4UnxxpcCbBgfEQ
> +fhru8D6Ie1VkUtLtQlNFh61KJDTZ1Sg2YisL1M1N/nRAH22pSaMxyX2kpXsZI7f
> WsCVIj3Rgow6vOqqUa85aYOqcyWllO29AMTMu+srAbfUWTIZ6iTtB5Dz5bC9oUPN
> YyfviJYySO6UocuuZH1AAmvPdoqlly11ouTiA69vlPIx0hW8o9U=
> =ZJU8
> -----END PGP SIGNATURE-----
