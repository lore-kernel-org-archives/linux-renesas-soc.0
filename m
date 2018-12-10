Return-Path: <SRS0=Zu5O=OT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890DEC67839
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 18:34:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4EE102082F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 18:34:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJ3yK8zG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EE102082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbeLJSeO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 10 Dec 2018 13:34:14 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50818 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbeLJSeN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 13:34:13 -0500
Received: by mail-wm1-f66.google.com with SMTP id n190so12086998wmd.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 10:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4XjguLCPmvqXsinOMfhdCLLALm7XQdUdXNpo9tOI29g=;
        b=DJ3yK8zGABKESeslMVjfrtrMynZBbErrQSUyhyZQPwB7EMYNDGT99pWGzmIMQB90mo
         Mc2RRSrtU42GwddxD2UIZV9cNSGfjMWPy5bd4tQ8tQo/T2YmQ5j+7MQGCZHv1B4IrSim
         oOJVRyEl9ii6Qmw1MWJt+ipTSYZUbNRN+zNpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4XjguLCPmvqXsinOMfhdCLLALm7XQdUdXNpo9tOI29g=;
        b=MqwHokMiDVvYz1M2/IEvpG8Yl5Sa2jzHh6vmr23/tWsBI6MgHz9o4YuGVnbopJMzZo
         dAMCtl83SKRpAxlrMd2aEa7WMiO09WNqAzx5GUDif+RVNJC2O5LVPUZd5au6PreiDFS1
         G0qjikp51cVoNSO0x4IWIQypy5oSp5iv40tdWF+GPIo/IRmc7perAopWvuw3vWhbK8ZE
         AbLP0Dn/ZanSMv1Qc0kJleTNSytHPUZkOGhRyCSls7PEfgEKF6ooIV+lSatXn4A9cGqc
         7AclE29DiLvm77vIfF4nBLIauVQdAP1YUvtl6HK5I45BGfDl+m7ffNPdp3RyZWNkmxKF
         1DPw==
X-Gm-Message-State: AA+aEWbKB6TJKJVC+/MshCDqEOzJaAnY9n/KO1XZz3I9TWidNZgCJzN2
        tbM2kv/p/QAYuWs6KK8XPMMPrkRfaYU=
X-Google-Smtp-Source: AFSGD/X9pb8vQsgrzrn2pdjPLhdofjYg0RuWVIgD0bimS5z5h1/Z2G7gk80IXKJkEmaOBDG3wx6T0g==
X-Received: by 2002:a1c:dc02:: with SMTP id t2mr5231203wmg.78.1544466851525;
        Mon, 10 Dec 2018 10:34:11 -0800 (PST)
Received: from [192.168.86.29] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id 202sm18521983wmt.8.2018.12.10.10.34.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Dec 2018 10:34:10 -0800 (PST)
Subject: Re: [PATCH v2] nvmem: check invalid number of bytes in
 nvmem_{read,write}()
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1544455701-5720-1-git-send-email-biju.das@bp.renesas.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <eb72f5b7-2920-b3b5-8387-d2b6b2d310cd@linaro.org>
Date:   Mon, 10 Dec 2018 18:34:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1544455701-5720-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
Message-ID: <20181210183409.cVdvSQfmbdFsHVf2OHPcKz4kaPGDzLWqensM3JNcIlo@z>



On 10/12/18 15:28, Biju Das wrote:
> +	/* Stop the user from writing */
> +	if (offset >= nvmem->size)
> +		return -ENOSPC;
> +
This should be "return -EFBIG" to make utilities like dd or sh happy.

Look at 38b0774c0598c ("nvmem: core: return EFBIG on out-of-range 
write") for more info.

other than that, patch looks fine to me!

--srini



