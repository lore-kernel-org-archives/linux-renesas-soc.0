Return-Path: <SRS0=U6l9=SP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D8EC10F11
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 13 Apr 2019 09:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DFD720850
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 13 Apr 2019 09:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="norNS0rC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbfDMJF7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 13 Apr 2019 05:05:59 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45549 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfDMJF7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 Apr 2019 05:05:59 -0400
Received: by mail-lj1-f194.google.com with SMTP id y6so10987414ljd.12
        for <linux-renesas-soc@vger.kernel.org>; Sat, 13 Apr 2019 02:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WWH7mxjg+xLc8yXeDuubFsNCyMvo0N23UkrS73ckmSQ=;
        b=norNS0rCUZ74CmvB+jbHTzFOaN6cM2yOQT9E5zlI/oDeYd0dqjQlK029J0FWMPMXip
         MhBJ+cZPCwBWEEcaeEsIO557P3vMAg7IgybSL0OMzwqRSjw+jq3xyWIt1XA6dMZtURnb
         QCFrpxCWXx+tp8tTIJQAdE29plMoC3OZJwBeW+Cp/m71rkSEIQ5YDTQef5W7TfsVXTBH
         nu7+nXPQWHQtKxIqmD3NkslQMsleD79OSQ0CWEtCdhAkGylvmynqJiSE6D/AgaumYmT1
         J1Ghf7+FGCaKKvYB35V9lp3fP4JCJQ5niPYcWakpLO5UKbztV2InxovDZm0n+sAum4AB
         bY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WWH7mxjg+xLc8yXeDuubFsNCyMvo0N23UkrS73ckmSQ=;
        b=jIa4hnxUwucXXQuGDB5K97NbkjeDZZ8yNeYf8msHh4707gksKGV56+kmd8kL//nS/e
         qYZJ2bp84mVWRrRQlqzMH6UE93zuengsPDtSSggOW5HcNhM3FwgWtFFVvwRQNgLrGAYr
         6AUOq1mvz+34axc3wA5wQ4poK8VWeuYp6vRUten9iv9Mmi9T1hTtaAuDZuQcuJZ6Fc/I
         pnNd+/pMjpSWQ3GvShlMSD9KJ05L5BN/HDDbGaol95+auy/xRxfbsa9j1jcunqiLeOxT
         bsZye9UABK8xTB/rfO9dumc7zCJfiQCAMC3c1UHo7kKEQfHDpu9I9yifqw3yCtg3aTyk
         nn+w==
X-Gm-Message-State: APjAAAWNo40EehOqbbg8Bt3nXm98BZeFFjavhsL356MZQnkJlxOa5rx8
        BGS9pI8UJmJZMlq7TVNcGbI/GrC68Tk=
X-Google-Smtp-Source: APXvYqx6/uHTeN5LtIVxsXu3LFk6NdQE9U4X+v2MFgwz0dLSxmIyTvzYimIiuCeMiQfZKxEaxEHcyg==
X-Received: by 2002:a2e:8ec5:: with SMTP id e5mr23366707ljl.7.1555146357515;
        Sat, 13 Apr 2019 02:05:57 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.85.47])
        by smtp.gmail.com with ESMTPSA id w3sm8760660lji.59.2019.04.13.02.05.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Apr 2019 02:05:56 -0700 (PDT)
Subject: Re: [PATCH 5/8] rcar-vin: Move pm_runtime_{get,put} out of helpers
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190412234359.5079-1-niklas.soderlund+renesas@ragnatech.se>
 <20190412234359.5079-6-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <79674484-ad51-ebf9-d5e2-997a4f2a5ed0@cogentembedded.com>
Date:   Sat, 13 Apr 2019 12:05:46 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190412234359.5079-6-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 13.04.2019 2:43, Niklas Söderlund wrote:

> The helpers rvin_power_{on,off} deals with both VIN and the parallel

    Deal?

> subdevice power. This makes it hard to merge the Gen2 and Gen3
> open/release functions. Move the VIN power handling directly to the
> open/release functions to prepare for the merge.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergei
