Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18B0C282CF
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 15:21:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A20CF20881
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 15:21:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Am3Wiode"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfA1PVQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 10:21:16 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36099 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfA1PVQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 10:21:16 -0500
Received: by mail-lj1-f195.google.com with SMTP id g11-v6so14576902ljk.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Jan 2019 07:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FEKBm4Afgc+0uf+ZrUUQobOFGdoiL39ByCGptGjRMEw=;
        b=Am3WiodeXzvf2r9GiZtjPS5A7mA0Hv7Y1SO7COjASBQ/ROguSRtnv0QJMTZhkZJkKN
         aWKN8Uytmrd9YKu2l49vYqd3xX7fCfGTR3hCvzRTTib2YmzBt9wKRIWS2l0owN97cC5J
         xyQO94r0pMfArJqhqpIZPgLed1zJhlvV84lGbKooDRa684KY35T6onVaSCagAUhqSj+z
         r3ouDTw2mPkswzysG/HMDtxxSetXTmejvZlgdIUaRxI96RFGvTj/MHOV4RQMPkVhdTb9
         DKOIdYeh+hZ9KE/JL0zOyg7pQIfioaH3y0UVFr+Hi/0YilRYBCSE5zvBNMERUWem/vHU
         YyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=FEKBm4Afgc+0uf+ZrUUQobOFGdoiL39ByCGptGjRMEw=;
        b=TAXa/enquwuJqZ/qHT7hBRI8CMfYSaOHn2uc35stNe6vFApKZ16+PcKjl1MPSQlKOL
         1i3orlK4qetkZA9a8273ktgoGlLV28h/o9eIxEBgygjlNfbGCSpDm2aIoIASX3Z5x/9W
         eTzm4Cr8yGjFVx7iziT+iiKbemSHUiUgB7SyVSShNRMa7H2MCGANatII4O18eM/7Aky/
         Ki90f8S3dgxoKHBRmLCxko+RJgfpGyq/g3kOAG6HagedLz12axZqOiZTeuJ9PtBorAK+
         fUoS0eWwiGNUE9zoxjeUWEpeNb4VHavsW79YypAy1eFQrmFRRER/vboDxKhQrolRmhvt
         KhbA==
X-Gm-Message-State: AJcUukeGUqL8rxWyF1D+LzPO+pzALRGXZvjCGaQQTkr8N8FTEzpPMtgD
        nhUJ38IToD6ffs7M/0/Vhayk7w==
X-Google-Smtp-Source: ALg8bN4cuEHq2p3fnZ18EYMPBHhArMWj5yItfM4bJ470W5PXeYh40J09ezM49mMr3yhopeE+rBDcdA==
X-Received: by 2002:a2e:b04f:: with SMTP id d15-v6mr17802047ljl.3.1548688873912;
        Mon, 28 Jan 2019 07:21:13 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.148])
        by smtp.gmail.com with ESMTPSA id s20sm2891495lfb.51.2019.01.28.07.21.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jan 2019 07:21:12 -0800 (PST)
Subject: Re: [PATCH 3/7] sh_eth: offload RX checksum on R7S72100
To:     Simon Horman <horms@verge.net.au>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <0476beba-ea1f-7675-aa08-573b74e84f4e@cogentembedded.com>
 <20190128122053.vb5ifhf34zbnuclp@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <916ed105-d499-4ca1-8418-4743b5a7a60d@cogentembedded.com>
Date:   Mon, 28 Jan 2019 18:21:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190128122053.vb5ifhf34zbnuclp@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/28/2019 03:20 PM, Simon Horman wrote:

>> The RZ/A1H (R7S721000) SoC manual describes the Ether MAC's RX checksum
>> offload the same way as it's implemented in the EtherAVB MACs...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Regarding this and the remaining patches in this series,
> which add rx-csum offload support in the sh_eth driver for
> various SoCs: has this been tested?

   As I said, I've only tested it on R8A77980.

MBR, Sergei
