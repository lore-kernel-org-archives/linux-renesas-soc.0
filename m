Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC73C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:46:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5CA172145D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:46:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="fpSXg3Zy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388292AbeLQQqI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:46:08 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43679 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727771AbeLQQqH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:46:07 -0500
Received: by mail-lj1-f196.google.com with SMTP id q2-v6so452252lji.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Dec 2018 08:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oyWj8GQLZkzmzSwjiuKRTZ/4Niy2YlTsakQt/1imZg4=;
        b=fpSXg3Zy4cSaTcXNcefbFmtIi666kJ8GvHIYaqaDUPVQLdDbml8oAIVA41HaMtUl4P
         JhrPXsV1lDiHO6N5SWk5ZYRXyShEcs4A2lpLNNhcCvR38aJZQq3tpPFgno0mXC4XlW5z
         dKdo0LcPEbIptyV9i15wve9Jgw2orEwaMOaqeIBo4+wY89ZuOMk3rWYqy1j6Th3zd1Dr
         jhC51Rt6ft55xsZdq1zW+H9Cr9RhUiCl3XuvT6uMjoXqlUNeIP73HzLu4ocNydyLpxM6
         fI6ztbp16HeaDHgv/tNgM7ByCqwTcyiRKJP1u17j5+DDEk8tmzlIzmD+bO5N1vJg5Tdp
         8wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oyWj8GQLZkzmzSwjiuKRTZ/4Niy2YlTsakQt/1imZg4=;
        b=ZhfynH8UrAhvr2fpeqYhetsixR+mICPAQIscs1you3/h93M1VVngmxdwYRdFWAil1i
         MmmSaYq/BH3SRkFQocBA2AHnr+ZsSgF/mf1DAQijB+oiAbvSNdYpxPwCZcE8sPmJ4QGR
         MrLJlp25tbZO5GinKuMh9ODS5oDNK92vf6NzImWIJvokIFZ1z6FZVvKGUVCh+4ttPJcE
         12r4nkNQ4DDOZz3uf2BOSYSr3RBtgpz4eVzKgj6gg9RcmsLESgTi4tPjhEHHAnk6f7fT
         qWiAcPbF1ix6eKihYSuIWYOiTKxE/aJuIUT1FGJmR7n8I0PrNS1Fc4N9OujaSrAE71xb
         GwSw==
X-Gm-Message-State: AA+aEWatfkEidWb2pW7RKt51Q0X5UnLNil3wr2kn7A8IkpEjBOqhse7z
        GkIF4bRPV4qnuFk9D1Ogmc6ADQ==
X-Google-Smtp-Source: AFSGD/UrFWxMzHvfWRNrbYUd7hq8EL/6QamUsu95uJbm2ojEpCqdQ8BdObdS3/w/381QZDoA8HJZiA==
X-Received: by 2002:a2e:5303:: with SMTP id h3-v6mr183752ljb.35.1545065165607;
        Mon, 17 Dec 2018 08:46:05 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.86.84])
        by smtp.gmail.com with ESMTPSA id y24-v6sm2577463ljd.20.2018.12.17.08.46.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 08:46:04 -0800 (PST)
Subject: Re: [PATCH 06/17] arm64: dts: renesas: r8a774c0: Add MSIOF nodes
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-7-git-send-email-fabrizio.castro@bp.renesas.com>
 <f6834dd2-7a2d-5ca9-0961-2c992ce22002@cogentembedded.com>
 <TY1PR01MB17700E941C41403A2EEF3DE6C0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <ae733707-ebab-b85f-c1ab-71bc87339a9f@cogentembedded.com>
Date:   Mon, 17 Dec 2018 19:46:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB17700E941C41403A2EEF3DE6C0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/17/2018 07:36 PM, Fabrizio Castro wrote:

[...]
>>> Add the device nodes for all MSIOF SPI controllers on RZ/G2E SoC.
>>>
>>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>>> ---
>>>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 62 +++++++++++++++++++++++++++++++
>>>  1 file changed, 62 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
>>> index 9532d29..9bd66b1 100644
>>> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
>>> @@ -855,6 +855,68 @@
>>>  status = "disabled";
>>>  };
>>>
>>> +msiof0: spi@e6e90000 {
>>> +compatible = "renesas,msiof-r8a774c0",
>>> +     "renesas,rcar-gen3-msiof";
>>> +reg = <0 0xe6e90000 0 0x0064>;
>>
>>    Do we really need the leading zeros in the size cells?
> 
> We don't, I just kept it consistent with the same definitions for the other platforms.
> Do you want me to send a v2 for this?

   Ah, consistency is good. Keep it then. :-)

MBR, Sergei
