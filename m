Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4ADC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 19:01:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AA0E20675
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 19:01:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Mf3AZTXU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbfAJTBI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 14:01:08 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35483 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbfAJTBH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 14:01:07 -0500
Received: by mail-lf1-f66.google.com with SMTP id e26so9080075lfc.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jan 2019 11:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=fdzSQblzmBGFzbYGErSO+PR2EX4SYeCCUJWMLHl4/G0=;
        b=Mf3AZTXUXhiD0Ek+Fxf+vzKR43LOwWDiIVsIzmx1gqPYDkpqf89/233Mwjfi++GL3T
         2sRvDL8a8GJsVg6bzjqmHG7JZIpCKSgVns56/aWwiZLzl8UtLr3ZjWQJ0LYlozEAOIRe
         1D0WS9PYdptNCi/MikgyUvFGhMvd4mBkdSUQHfXp4PiuLet1lxEhxF1fyw4UZl25yvHC
         TOtCI8XR0iWie6+o28a4T5z8NzkH976SmQe89rbDlMsZTUC5kd2p5BIR/bKqrrNOr479
         CCIbNovW6+ekYrk/do25kZFTJ7GZsCa5KsXv7EjLs2d8CsLThxJaXKUaT4+UPrFOTn0q
         r5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=fdzSQblzmBGFzbYGErSO+PR2EX4SYeCCUJWMLHl4/G0=;
        b=cN8SNXRNpSipv8u+yReKJO9sarcc5AMYQzdZhxEZyOSBj8nVJC5GEaIrEPjRBLxMbh
         grtBAVkWjRHElVPnuz5O7dAXfX3koJbBePI7Jd+/7OcSTdei5WmAVIynt5VPNzbX84EJ
         dYihe5XXuQnQEzrog2bsojPbsd2PXtSag8H7fN9O+GNVwaaUElUGha+9rzmSDifQzv10
         HIvTw6XUxNPDTvKTqiEllBk3/nXY/tOxRzdlmPJWWjtAAYkK/nBZGbusG1TxEkPHe3wQ
         iGDeQuouNZ5YrF+0S8LDtd/Jn5HNJqrmEMW5jT9UVwGZTnZWhmHi1ut3PjMaiVEHQaNk
         s/Iw==
X-Gm-Message-State: AJcUukfGkjn8MIe+bbVwCk5QHXKktVF4cL7XuibkTew48QKDq997etxF
        wLpcJmFlFtELcjpi6Wy5FD+sIA==
X-Google-Smtp-Source: ALg8bN6Pdz4US8yzMK0Kgr3tpcR5a1elGSCa1moX+9hFxXNDOTYq2HFI8fLdiTuxqi+KLsAAE35J5g==
X-Received: by 2002:a19:cd50:: with SMTP id d77mr6379919lfg.125.1547146866027;
        Thu, 10 Jan 2019 11:01:06 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.92])
        by smtp.gmail.com with ESMTPSA id c203sm14331673lfe.95.2019.01.10.11.01.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jan 2019 11:01:04 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH RFC 0/2] Add R8A77970 support to the Renesas RPC-IF driver
To:     linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Organization: Cogent Embedded
Message-ID: <c83b1e54-016f-ef28-6bc9-9be9410c0d9a@cogentembedded.com>
Date:   Thu, 10 Jan 2019 22:01:04 +0300
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

Here's the set of 2 patches against the 'devel' branch of Simon Horman's 'renesas.git'
repo, the 2 patches adding R8A77980 support (posted before NY), and the Renesas RPC-IF driver/bindings patches v5. We're adding support for the R-Car V3M (R8A77970) RPC-IF
(which needs a special handling)...

[1/2] dt-bindings: spi: renesas-rpc: document R8A77970 bindings
[2/2] spi-renesas-rpc: add R8A77970 support 

MBR, Sergei
