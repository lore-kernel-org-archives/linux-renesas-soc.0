Return-Path: <SRS0=XP2S=QL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F34C282CC
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 15:17:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7583E2080F
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Feb 2019 15:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="LR2UCBwT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731154AbfBDPRZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Feb 2019 10:17:25 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34370 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729712AbfBDPRZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Feb 2019 10:17:25 -0500
Received: by mail-lj1-f196.google.com with SMTP id u89-v6so197063lje.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Feb 2019 07:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EJnLivDhl32nQB3j0aNa0s0KA7ezg1F9qzf+ZQKVttM=;
        b=LR2UCBwTwV7/y57LV5APXzU0IlMxpcP+QiBYY0sup0mdHUgul5x3iIPryXYz3NJz58
         /WXBlJUg25WeoLoCuXy3QbHa1a4++SK6B8aHYLePFIVsrPeFZJnOGrMbWbcGLU5JI1CL
         NktRjRZX8fRsTxAJGmovCoy2wah07CuYEKctmOSBeIaUILlA2vUHRJaU7HtX/rrLWNRB
         VFDmpzAf16EP43bJc1E7jIehJfqPp9odlH2quMQQDPbrdgw9yTdpQNjV3KiSgALxaHP7
         t5KXBKQ7S6H/zjRSKYZc7ds7JEBcJ1onWPNO6vq8YHBCfeJKrxoZzJ/5RWWLioBrjq7Z
         PGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=EJnLivDhl32nQB3j0aNa0s0KA7ezg1F9qzf+ZQKVttM=;
        b=ZnJgOjih92Tu5SmGy/3UnLggQ95QKG9YONnzzH/mzqdBWQS5Si7T5o7x+zE85Py9z5
         lGpk9jrsr3OKyJ/wPXSR/8HuNyyImyANISLabF47zu8dwtz1yQUcxCN+wz8dt66tFm9T
         3mcsMEPFTAcZOqiVZPimQ4kFM3iNsB3ukYpO6J5MYf5qyD5TP7mxLoLzCjeSIUDkZXon
         cs4jgLj21Z3IDhfSFPf6bOI0DWvE9/PRPkYD0JVBroe9HSHQLz/LjrL9caX1wloAJb9m
         CJajeyVTBDDazi8QfLKTNR7oeRoDiRDtX7h8z/0ChgTMBjb925tYGz9XJPY83ozQsN9J
         4fpQ==
X-Gm-Message-State: AJcUukel1juRXOOS7uiCzCiylEWcUb+0nqgi5SSlFJ2XMnffH/4Hbf2l
        nhD+nmF0f3hjRVICVoYoAB+ypg==
X-Google-Smtp-Source: ALg8bN7kmVxHwAKLsAuvnHjBiZlcJf9RyPUErCRe7xHHkQuBsJ8elYYaeR64n9Rgqs6pinXoJ9p81A==
X-Received: by 2002:a2e:21a9:: with SMTP id h41-v6mr40187127lji.103.1549293443439;
        Mon, 04 Feb 2019 07:17:23 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.140])
        by smtp.gmail.com with ESMTPSA id f123sm2477621lff.41.2019.02.04.07.17.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Feb 2019 07:17:22 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 7/7] sh_eth: offload RX checksum on SH7763
To:     Rob Landley <rob@landley.net>, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <e8ce7a88-b689-6114-66e4-c45a95087a1f@cogentembedded.com>
 <2859e252-a900-fdc7-bfd8-d1b7663174f2@landley.net>
Organization: Cogent Embedded
Message-ID: <a7938d32-24bf-146a-87ea-62b765b0337a@cogentembedded.com>
Date:   Mon, 4 Feb 2019 18:17:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <2859e252-a900-fdc7-bfd8-d1b7663174f2@landley.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 02/04/2019 02:55 PM, Rob Landley wrote:

>> The SH7763 SoC manual describes the Ether MAC's RX checksum offload
>> the same way as it's implemented in the EtherAVB MACs...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> I think this is the chip in the JCI N40 on my desk, how would I test this and
> tell it was working? (Is there an existing test program or...?)

   There are programs, yes. I used (rather old) netperf-2.2pl4 (I can send it to
you) running under perf (provided by the Poky rootfs). The details running netperf
on target are in the patch description #2; on host you just run netserver from that
same testsuite. The current netperf is maintained by HP on github but I was unable
to figure out how to build it quickly enough... :-)

> Also, can this be tested under QEMU's r2 board emulation?

   I have no idea, sorry.

> Rob

MBR, Sergei

