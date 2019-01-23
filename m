Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AFBC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 15:43:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D726A21873
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 15:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="NNTUVLD8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbfAWPn2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 10:43:28 -0500
Received: from mail-lj1-f171.google.com ([209.85.208.171]:39071 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfAWPn2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 10:43:28 -0500
Received: by mail-lj1-f171.google.com with SMTP id t9-v6so2337056ljh.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jan 2019 07:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eaZMyyV3DpiVdYmApnZpwkQ0/xdB5NLudo2cRdg7dpY=;
        b=NNTUVLD8p5Uyre84F169x2rQE8yWlpZ/Q97rstEu904z5IlPy5B8eUw0uO/ymMoRMc
         uUTXPSWYzrnRc3R/oAwsO/YdDIXuBrtsg8ROODrFX3NygGMLzgCxYQU9bSECIgvNTtgm
         J6WfpQWJ0gFIiAupvB59DO7/enn+NWWAMvbRX9MDIevj9nMdZ3IjwVzEe1lyA2UK+DaM
         aClnR9egRkRQI8LgKNsqUo/RcuPHuouwVgENHzRQxrSuwHPc4CAQAkXaxhygXDE7Vs7U
         7dYuUbKiGCqgzyvKhg9rlKkW2U+kFIHJGIDT7RDg3zshTFiLVkzod2pFG1Tg1KzP1j6S
         0Xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=eaZMyyV3DpiVdYmApnZpwkQ0/xdB5NLudo2cRdg7dpY=;
        b=f07AUvb0wmAKTTo1iBAX8fNaag0TPLktIsmMjX+ZyzUUFVwmD1QYrgRU22xJnM61ob
         i8Hh+rrNldehRlcxZEZaLd1DybEI0d2rVigMSh2MZwx3MnxanulLl0G8ouMq3QTgIF9v
         0qv7xzqosZoA+etiIoNFG3q3BLCEZlBW5/gZ8IIZl6eXn/AWxXD3xYrEU3yCRJQwO423
         GrWGMALCuV5ZNKSvGqe8YqJ8WYRplQxk2zTS3GmWN6hqC5+kbAyoqyJbHWsq1Xtb85X2
         vGW5a95QBRKFnNeARVkF/bmWezg2sUZeXaBXoPpSB9l3I6uNs7NC360J2tVnNBdvuAhq
         S20Q==
X-Gm-Message-State: AJcUukd6w1HxxiwTlkJ1IxavMF7HVDxZoE89JJzzVCFpk2rRmfSYbk95
        /14yhxEtYi2vDIDFqAJSHHz+WvxrRmA=
X-Google-Smtp-Source: ALg8bN6L075PstuFJHww1KxrDfdTZUgO3pFXFcLPFm9lu0qGvorroNaskbBrwIix+5QM42LYwTLydQ==
X-Received: by 2002:a2e:29d7:: with SMTP id p84-v6mr2469398ljp.12.1548258206320;
        Wed, 23 Jan 2019 07:43:26 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.180])
        by smtp.gmail.com with ESMTPSA id u26-v6sm555335lji.22.2019.01.23.07.43.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Jan 2019 07:43:25 -0800 (PST)
Subject: Re: [PATCH/RFC 01/02] arm64: dts: renesas: r8a7795: Remove IMR-LX4
 device nodes
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Konstantin.Kozhevnikov@cogentembedded.com, geert+renesas@glider.be
References: <154807139502.25511.1919986589060151108.sendpatchset@octo>
 <154807140504.25511.16758316156851099392.sendpatchset@octo>
 <20190123095911.m2y2opklkwi32qrj@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <565964ec-612b-f04e-5150-d05b480e1c0e@cogentembedded.com>
Date:   Wed, 23 Jan 2019 18:43:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190123095911.m2y2opklkwi32qrj@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/23/2019 12:59 PM, Simon Horman wrote:

>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Get rid of undocumented IMR-LX4 device nodes for the r8a7795 SoC.
>>
>> I would much prefer to have a proper driver with documented DT bindings
>> in upstream instead. However removing DT nodes seems better than this
>> current half-way state.
>>
>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> 
> I agree, likewise for patch 02/02.
> 
> Shall I go ahead and apply this series?

   I will return to the IMR driver after I'm done with V3M/V3H (and I have the HyperFlash
driver to push upstream yet for those). Sorry for dropping the ball here, it wasn't my fault.

MBR, Sergei
