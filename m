Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F54C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 08:28:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95D1820657
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 08:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="V48kkCle"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbfAQI2B (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 03:28:01 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39949 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727596AbfAQI2B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 03:28:01 -0500
Received: by mail-lj1-f196.google.com with SMTP id n18-v6so7805035lji.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Jan 2019 00:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yQ1oCmzH4/weCAd74Eio1QwJmE89SxLl6kpKVWvNthk=;
        b=V48kkCle8k2w3VM21pFm1t0sEC1JA9Jm015BRW1gcFUqD5aqafh+COxpYJ2bCuQ0Pr
         mtNo9cW4Ih7nyNd71OZSwwUBa3Q/qPjHKLAYfWhf1XRIKf/irgDLuSXIntDzBHBYoLCu
         1ZB812WRaV8f+FI+42UdKmCkFe6JbnNIT3Ps7652B8/0XFJg+6zt+Nxf2Av0Oo6PDTwI
         4t77uCyUdNSkHX5MIEaJX4NWCC8UZC1MzzAyitmmYLBL635uVCgN1TB76nYcuHiq1YdD
         0LP4zqK2edkgvwi5yD//inOBCyBChfQ6XULWQwHgdx14dieM4ZcOrNyeBmbR7Zfa+JjB
         ZUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yQ1oCmzH4/weCAd74Eio1QwJmE89SxLl6kpKVWvNthk=;
        b=PJWogh4sEJUjjmvbtqWI01kiTJ2zIeszww+8SnPiblJikBlklyrcsNJsEOh6hesXO9
         GB3axGHUSm6BQ9orJX3UWGQYFf7TE1ul9tdLseoFx2QrZD0JaC2QuSOvtigYII22LxUF
         /zLJ8uR/RtK5FpWELQylDR6+Agu4o0iUfuw5DPGkDzR4+fVyF+l5cOfx6bDrtGIKxXxu
         rxIGRDXd9Zpvh6hmJdyxCL3y26f9mwvyuiTaiA87iRdfXs0W+AxhnNR86/bCleG5u4Ip
         +XpZw8AOqn03g2f9EmEalrU1wBR2CAWCw/xktSVI1aQfVKSb300ARTuHDIK5jdABi4w6
         nEgg==
X-Gm-Message-State: AJcUukdYnPyJgvQg4lIR1pPT/kGctpsHDM7aBIk+E5AnOO/6seJRJpmN
        VMVpRHKsgmR/rXM1TiKXBPNLdA==
X-Google-Smtp-Source: ALg8bN6gWARk/cmGiaUbrZF9yIqQx8CuhvN0NTnOwmE5OUVYWhesBRwlsP4OBYFW0kQa1b7NoGGDmA==
X-Received: by 2002:a2e:1b47:: with SMTP id b68-v6mr8080999ljb.104.1547713678715;
        Thu, 17 Jan 2019 00:27:58 -0800 (PST)
Received: from [192.168.0.199] ([31.173.80.86])
        by smtp.gmail.com with ESMTPSA id h3sm161389lfb.49.2019.01.17.00.27.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 00:27:57 -0800 (PST)
Subject: Re: [PATCH] dmaengine: usb-dmac: Make DMAC system sleep callbacks
 explicit
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        vinod.koul@intel.com
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        stable@vger.kernel.org,
        Phuong Nguyen <phuong.nguyen.xw@renesas.com>
References: <1547692896-2362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b922383c-51d8-e9ac-21ad-cf3c1e8fbbb6@cogentembedded.com>
Date:   Thu, 17 Jan 2019 11:27:47 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1547692896-2362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 17.01.2019 5:41, Yoshihiro Shimoda wrote:

> From: Phuong Nguyen <phuong.nguyen.xw@renesas.com>
> 
> This commit fixes the issue that USB-DMAC hangs silently after system
> resumes on R-Car Gen3 hence renesas_usbhs will not work correctly
> when using USB-DMAC for bulk transfer e.g. ethernet or serial
> gadgets.
> 
> The issue can be reproduced by these steps:
>   1. modprobe g_serial
>   2. Suspend and resume system.
>   3. connect a usb cable to host side
>   4. Transfer data from Host to Target
>   5. cat /dev/ttyGS0 (Target side)
>   6. echo "test" > /dev/ttyACM0 (Host side)
> 
> The 'cat' will not result anything. However, system still can work
> normally.
> 
> Currently, USB-DMAC driver does not have system sleep callbacks hence
> this driver relies on the PM core to force runtime suspend/resume to
> suspend and reinitialize USB-DMAC during system resume. After
> the commit 17218e0092f8 ("PM / genpd: Stop/start devices without
> pm_runtime_force_suspend/resume()"), PM core will not force
> runtime suspend/resume anymore so this issue happens.
> 
> To solve this, make system suspend resume explicit by using
> pm_runtime_force_{suspend,resume}() as the system sleep callbacks.
> SET_NOIRQ_SYSTEM_SLEEP_PM_OPS()is used to make sure USB-DMAC suspended
                                  ^ space missing here

> after and initialized before renesas_usbhs."
> 
> Signed-off-by: Phuong Nguyen <phuong.nguyen.xw@renesas.com>
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Cc: <stable@vger.kernel.org> # v4.16+
> [shimoda: revise the commit log and add Cc tag]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[...]

MBR, Sergei
