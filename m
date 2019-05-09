Return-Path: <SRS0=hqPp=TJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66548C04AB2
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 May 2019 16:20:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39A01217D6
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 May 2019 16:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="MSCEu1Au"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbfEIQUv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 9 May 2019 12:20:51 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37861 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbfEIQUu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 12:20:50 -0400
Received: by mail-lj1-f195.google.com with SMTP id n4so2550862ljg.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 May 2019 09:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oh41XTRfQ2hEQxbfWj77USA9ai+rN4+FYJEIHIYPQ50=;
        b=MSCEu1Aud2SLjXb7CPRb2JObZCwCz2T2wncAxxSLqNI+P3ZJnyYzj3LXqosy/DW9ck
         SZAQhMPo16TiwBKKf8okUSLDX/Hm1n91JYrYGiEZhydTMGNp2nlrnfV+i9+JTn+W72TY
         n2/8ImX3xbYgn3emRAen2SATySzPT9lGy8gfQpElm2W5WEr9+Vbz/XSAWCwzeZYxH8sS
         cNPRQtqo1FoCHuklAaWddmLT/arNK7bm5lZIumHgs8BbIm8OzQ6yzCx6OQilBBKlTzZ2
         mEWlYiT9255k2hQkp2z6eP0Aos4XHGjRffm85Y8fUaqZDkhdiHDVPIgeMHptgj5JfERK
         nAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oh41XTRfQ2hEQxbfWj77USA9ai+rN4+FYJEIHIYPQ50=;
        b=L06p1gVbTJBAWoEP1coj7OObSTbP8+Am3DhZ66l5hHhvYLROVDqSQ6iMnq6XjI6B1h
         M3m3WWycPIXK+ghs6a/m4QnIoqu2velEdfv9xbEGKfKZVVZdC1r/aGE2CeLgc/Y03t/a
         5ePMvY2Mg8ob38IFRl1UccnBnu+6ouy22Z1HmgUjPsxwjku/SOr/Lt9a5XkHc1hE42Tq
         a7D+bYXoVwDj8lpp7vVrPa0B2kVJZaiVWUAbdBJUGFOo7b0Jewsfs4WRFpvVnGPoioFS
         4y4NratFs7LZEqCstoflqnAS6eUY5/4Jts8UhL2//Pd0zU+HuWLghtrsMOrKwLkR9QIO
         CD+g==
X-Gm-Message-State: APjAAAU6cpF8KRFBMggW0D4f5VZBDt+PgxFAWe3h9ejppxmm+/YgryyV
        lnWkbszN828KK0/TbvljG5amOA==
X-Google-Smtp-Source: APXvYqxGSg/jkWz4uW+fNqpxwMK3znRd6PASiue1jnbHzmriv4EAToS24KtCkbili18pFdfHiv+CWQ==
X-Received: by 2002:a2e:888d:: with SMTP id k13mr2879671lji.18.1557418848703;
        Thu, 09 May 2019 09:20:48 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.83.188])
        by smtp.gmail.com with ESMTPSA id d1sm426826ljc.89.2019.05.09.09.20.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:20:47 -0700 (PDT)
Subject: Re: [PATCH] dmaengine: sudmac: remove unused driver
To:     Simon Horman <horms+renesas@verge.net.au>,
        Vinod Koul <vinod.koul@intel.com>
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20190509125211.324-1-horms+renesas@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <522c16db-be05-524b-70cf-eb0dcc3c53bb@cogentembedded.com>
Date:   Thu, 9 May 2019 19:20:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190509125211.324-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 05/09/2019 03:52 PM, Simon Horman wrote:

> SUDMAC driver was introduced in v3.10 but was never integrated for use
> by any platform. As it unused remove it.

   "It's unused" perhaps? :-)

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei
