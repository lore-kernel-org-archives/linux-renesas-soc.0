Return-Path: <SRS0=Lk/a=PU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24554C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 12 Jan 2019 17:41:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E433220836
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 12 Jan 2019 17:41:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="CVox5jCK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfALRl2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 12 Jan 2019 12:41:28 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46844 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfALRl2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Jan 2019 12:41:28 -0500
Received: by mail-lj1-f193.google.com with SMTP id v15-v6so15575511ljh.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 12 Jan 2019 09:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=7wLwK2UyVEJmCQYhVN7LeHork7DWuhMjCzgChdYmvbM=;
        b=CVox5jCKxrGMzgXFKskTrKZHWFOTCYNJ4k8B+Rp/ni66rdndsirOfmNPBSLFciEd55
         zift15j14LTtsIssJzyIYXemvJECSy25oG4IZSxK61/I4l/N8thcneTR+HGegBJ7NknY
         yFWes17FdSLbZjzEBUlYi6k2vKTrWu3nZMp5Hwr+gqn5ikpNrxcXYz+Yoc6y+RKC/Qip
         qdCDJpy/aUBYVK1Lpv8AM4/lxyRcl5hC+KUWWe0uGgTuUOl2voIajm/0yUyCvK+yfXe4
         PTKYjZZFP1ckHR9zah/refsBSEcqu6pjrlbj2rv2de75zsDlbDccvz+RB6x9nIHgtYsN
         T0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=7wLwK2UyVEJmCQYhVN7LeHork7DWuhMjCzgChdYmvbM=;
        b=ft4cJ8FgAtRHer//Yz2zGb68YXlwZyjGLTYbyiUXKd1H99AxwjzUdZi0FlJTJrI7BU
         7vYkrZL8TxFmMOd73MGxe12ux+YUm+LVq+CKi5e61M94ty+nK+fj93bznduLl1gJxf7v
         f8rskt0UEM65qA5c5gXtwWJ9/4PR4K5n21I7yeFkd1W3p/wn+DqWTrF+7BlJYJlf3z5d
         Y66Syquqf/wGrQIuuhF0JaWdY25+0RvcXQhnq0slJoNdmzrvhg4U6xya6QKNp5OQJM8c
         xVPolUCt5WiBm8Kyav16pCnS/NcNjJq6rBlrpulB5dgwuhZoLe9LWl4ues6Pez6RQbXY
         s7BQ==
X-Gm-Message-State: AJcUukcWGC6TxQ2Y+wQ5EuTmMIK5P71DhdsPHLBSe/exlEqe9VR3v6nt
        NpYe0kDgj9zrMzwBHUoy0L+PbQ==
X-Google-Smtp-Source: ALg8bN6pv/bJEWVOnV7qIDasJBe9t43SSw6YTK9e21/KqmDY6A/yP/AaHMI4kIOvnL7hoqP4ZYEJ3w==
X-Received: by 2002:a2e:2d11:: with SMTP id t17-v6mr10735594ljt.159.1547314885977;
        Sat, 12 Jan 2019 09:41:25 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.81.102])
        by smtp.gmail.com with ESMTPSA id m4-v6sm16146982ljb.58.2019.01.12.09.41.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Jan 2019 09:41:25 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH RFC 0/3] Add R8A779{7|8}0 RPC-IF support
To:     Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
Organization: Cogent Embedded
Message-ID: <4b74a2a5-6b3b-9b06-6a8f-fce39124ec59@cogentembedded.com>
Date:   Sat, 12 Jan 2019 20:41:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

Here's the set of 3 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20190110-v5.0-rc1' tag. I'm adding the RPC-IF device nodes
for R8A77970/R8A77980 (based on the RPC-IF driver which is still a work in
progress) and describing the QSPI flashes connected to RPC-IF on the Eagle/
Condor and V3M/V3H Starter Kit boards...

[1/3] arm64: dts: renesas: r8a779{7|8}0: add RPC-IF support
[2/3] arm64: dts: renesas: r8a77970: eagle/v3msk: add QSPI flash support
[3/3] arm64: dts: renesas: r8a77980: condor/v3hsk: add QSPI flash support

WBR, Sergei
