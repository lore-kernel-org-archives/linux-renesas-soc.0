Return-Path: <SRS0=hHdZ=SZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09C7C10F03
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 15:18:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E60220685
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 15:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="V/paA0NN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbfDWPSj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Apr 2019 11:18:39 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40322 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727877AbfDWPSj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Apr 2019 11:18:39 -0400
Received: by mail-lf1-f68.google.com with SMTP id o16so1272301lfl.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Apr 2019 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HnnWMR8yRCvmY/zcxe5QHc+KR+dIZPb9Kk8hdid58ZA=;
        b=V/paA0NNn9kVYrSYJWkQkAgqv0hGQ+bNXmQsGrl+zWFZlOfZo6YwPIRannCiSgqy1L
         eujIIhi7iNgNJkCLJkUrVahc2vyh03O8GYL3fQHdl/x65qPRETtdwZjv/SXd31vAdanx
         J50BcLbFRqI7pKCcP5Od/6LQbAowvoyT/BtQrmd/upSrwkPL2VDdo5FAyDezi2/JD6uH
         f2lUQn1c+wX6h4Ub0vrLzfzi+FXSiGG+GuiTS284WaAkVW5DRqRliOzSBxvZs476iq+k
         6lWaonhv9kwkQBKJ9NzxiE0cKEr1QShiAWZ7K73Y3oA8un4n7d/4TuJwzCcfZ4md0TBA
         /8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HnnWMR8yRCvmY/zcxe5QHc+KR+dIZPb9Kk8hdid58ZA=;
        b=tX6cSBKAVkbqOBouKUXfK2WegSJ10JOJO7lNHSsmiuCe74QAhM7txL62ziClcjokeh
         5Y5oz2tfK2ldDYX9/qe6lgamOMk4FusyWLGxAaP25wdgWAW+XkWjsg0BRI7i7jPWtKde
         whuGfrG8F4yD64bb13l5jeU5lQ2vGoQkcyL5FmVgtU6Dihrv2oO6qY85ZsSPa+wa7piM
         r4BuMjpjmb7hD4TQ0lve0qQBbWwSOsWXlp/kqpDnFKm0Ef4/Tgy7OxrXjBseBqb75gdt
         VSMnYUGNRBjs//vPi7O6xHziaaJXQl8zk94rAurOarAAr//+D0xzyBUjCzKZuNkvGpcz
         AtwQ==
X-Gm-Message-State: APjAAAWWL/8i3PUTJvBgIF62yCamYT+eoG3nuTsQn2ZYMttuYijdc2Pd
        nPEQDZmKBzPKw4bzxyolw9ErhA==
X-Google-Smtp-Source: APXvYqzEKvKIJoK2k0ube39oYNhWILegM3PqiE6awbCIoChcVSWNWHLi+OaT8OW33/QrDf0wi5pXfw==
X-Received: by 2002:a19:5218:: with SMTP id m24mr12959687lfb.113.1556032717057;
        Tue, 23 Apr 2019 08:18:37 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.82.73])
        by smtp.gmail.com with ESMTPSA id j24sm1022282lfh.28.2019.04.23.08.18.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 08:18:36 -0700 (PDT)
Subject: Re: [PATCH net-next v3] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
To:     Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
References: <20190423130153.17295-1-horms+renesas@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <8f6ce269-5d2b-240d-3136-91a585a66631@cogentembedded.com>
Date:   Tue, 23 Apr 2019 18:18:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190423130153.17295-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 04/23/2019 04:01 PM, Simon Horman wrote:

> According to the R-Car Gen3 Hardware Manual Rev 1.50 of Nov 30, 2018, the
> TX clock internal delay mode isn't supported on R-Car E3 (r8a77990) or D3
> (r8a77995). And by extension it is also not supported by RZ/G2E (r9a774c0).
> 
> This matches all ES versions of the affected SoCs as it is
> not clear if this problem will be resolved in newer chips.
> This can be revisited, as necessary.
> 
> This patch does not error-out if PHY_INTERFACE_MODE_RGMII_ID or
> PHY_INTERFACE_MODE_RGMII_TXID are used on SoCs where TX clock delay
> mode is not supported as there is a risk of introducing a regression
> when used in conjunction with older DT blobs present in the field.
> Rather, a warning is logged in such cases.
> 
> Based on work by Kazuya Mizuguchi.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Seregi
