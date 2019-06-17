Return-Path: <SRS0=vAcw=UQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE09C31E5B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Jun 2019 14:48:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2EF820833
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Jun 2019 14:48:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="uAWSr7VE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbfFQOsG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Jun 2019 10:48:06 -0400
Received: from mail-lj1-f172.google.com ([209.85.208.172]:35829 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbfFQOsG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 10:48:06 -0400
Received: by mail-lj1-f172.google.com with SMTP id x25so9608514ljh.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 07:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=23L2vIVQ2W2iVoAA4qUPxYElTlOJeKOi2mNOHHgrs90=;
        b=uAWSr7VEQDRIoUGq7pmTfDMitdl8h/kgQzbSJyVAGrzdXuxUXzcG7lm9xOLjfAyiXN
         N1BUCVRhFeck792ZGgsYXD7wxLCIS91drF6LLOGZjfo2ILojpfxwbEbQsncCnKXajvgm
         XRvmbesZ6cihJz2D+Bgh+k6hlGk3yFz+8v1DlE5MQOcEiQu5v5EVJOgQ34YWm65gINJP
         Jg5g7zaQzVr3oy3C2pZZwdX/X4NNKe5KBoQUopQj8ZHohhyZbZGcvsJdttOA7zCmhDM3
         fHAf1Ft2j5YO80QkPcznzqk21ITPLM9rbo5npwKWNs5VRYlPH4LHyO6uPOM9/43ibS/B
         XCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=23L2vIVQ2W2iVoAA4qUPxYElTlOJeKOi2mNOHHgrs90=;
        b=ZIqDF+eHNiRhletPrpZ/6g2HytObxBpCGzKVQ85VR3JVZqLQVYhAW9squ9iZiTx2Vl
         upkAnGa1j1Jh93ofsqw5sMwx1lwvUY9DBChOdn4FC2xcYlLP6RDfh4L4kQkSXP+/RFEa
         BvtdFsmf0SGKKA0MrQSLsT11A5MRD033OPAms84ilFFbzuykGlobbk7AZ1szAniAgwy1
         crXrRJ+rSsJKBK/Yxd379GF8jL+g7LRYb9UyK+tgCeHd/1re7kIeiCCQevs3Lr0znEP0
         F/ZsdcyQt02c4MFvwpbcCWB7my/jUm5QWdX4/ATDI24wh4bfQAUESP2g4NmNoGdEh3I8
         S5oA==
X-Gm-Message-State: APjAAAWhtvazL/+Wlz2ifW6gpOgvGOGpAnjowUvfTQFRf6lAVbYoAqks
        3E1+2BblpLOeBSYhkhS/AWOrx3mOdf8=
X-Google-Smtp-Source: APXvYqyDl1lpiNWVeIRxOZwRpTApoj9GbJ6hcu3I5aGfKWXSlxMsRBEBgl6FiN3WDUF5p6vqdyCoIw==
X-Received: by 2002:a2e:3807:: with SMTP id f7mr19666039lja.87.1560782884570;
        Mon, 17 Jun 2019 07:48:04 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.84.129])
        by smtp.gmail.com with ESMTPSA id i2sm2145011ljc.96.2019.06.17.07.48.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 07:48:03 -0700 (PDT)
Subject: Re: [ANNOUNCE] Renesas tree closing for v5.3
To:     Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190617100008.zyg6y6qdtwetbtid@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <8ddeda86-377f-27c3-9031-62a36120c354@cogentembedded.com>
Date:   Mon, 17 Jun 2019 17:48:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190617100008.zyg6y6qdtwetbtid@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 06/17/2019 01:00 PM, Simon Horman wrote:

> I would like to stop accepting non-bug-fix patches for v5.3 on Wednesday
> 17th April (this week) and get the last pull requests posted by the end of

  19th June, perhaps? ;-)

> next week.  This is in order for them to be sent before the release of
> v5.2-rc6, the deadline set by the ARM SoC maintainers.  As patches should
> ideally progress from the renesas tree into linux-next before sending pull
> requests there is a few days lead time involved.
> 
> Once the tree has closes for v5.3 it is intended that patches
> will start being accepted for v5.4.
> 
> Thanks,
> Simon

MBR, Sergei
