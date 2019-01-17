Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1013C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 08:23:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAFA920657
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 08:23:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="dbYl6gKt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfAQIX1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 03:23:27 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43718 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfAQIX1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 03:23:27 -0500
Received: by mail-lf1-f68.google.com with SMTP id u18so7059876lff.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Jan 2019 00:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xVkvzDEaJlOeC04e4FDA4+Aj1OW8DICi2kMpBNRCWjM=;
        b=dbYl6gKtA4dURsbz+H+PTWuF+ZfgZRfYkoIdjMwbypdoUAmU5i7pGN0Nbiqiz9Cw0/
         jP9wviJzuS4rO+L+w0sqml/Iu0YovOHG/iaxrU/T2Dq/AkoiuTWok7scd25Gkvzo5fAV
         faYPn5s22+1duHqKHAMSRhBgMkf3yblF2GUDdieqb5kCwdVvkiBuwWyWx7aCQGvMij5W
         1xudRqC2wG3WXUwqw30vVgN2lOYb1x6lY8t+5srbEzHnZmMIyPBznfyXVZPV6wGMcdfU
         te/+4Vls2670sggQOghFtvlHJIFeL6gLS/2U88387CoKtpg/i4ZR8AdEq4ehZ6feUJfc
         4EVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xVkvzDEaJlOeC04e4FDA4+Aj1OW8DICi2kMpBNRCWjM=;
        b=dOS1Q0WHG6PXzBnvTRmvR+7LXzWxDRDcPDZYSPBfM0aDUIoZ6TWF3cvoad1V0Km887
         GrXMU3AaxpI0E1mdvRokpxNV6cDkIoQZ5HZmN5CHgrUetWwgj0THXkEL3z30PjlFQ7gx
         xN8JQ+EFNizBwo2t7kpgQGWeFczRmYnJySoK0Hd2gg2MA+ppLxvseeg7kj1DZ29XPkd9
         dHQkam57f3B3++hOo2cqn79sl6mrChmJK7d6QUtB1nEQRtXr41ca/emLrjECyOigsogA
         Z1o7OTT4uViMYvimZbj64RIMY1+HrPVrk9G5a1uaWdmUsYuXP8uvCF5T3zRbRHcbI9Az
         IT2Q==
X-Gm-Message-State: AJcUukfydDuJmfWgf8smqOxhUz5+UFqVyAH7jpXdpEojAoSqiKmN2d2d
        XPtyTKlPTxUbAOEbdY2lfC5eijBEZGw=
X-Google-Smtp-Source: ALg8bN4adnSzttQ1aC0Mbn44ggwnhQSbol8SZjlHBYnAMvvE2BinnNNt9qFvbOCTrsJGRZ+qFqyrzw==
X-Received: by 2002:a19:c995:: with SMTP id z143mr8692589lff.79.1547713404896;
        Thu, 17 Jan 2019 00:23:24 -0800 (PST)
Received: from [192.168.0.199] ([31.173.80.86])
        by smtp.gmail.com with ESMTPSA id x16sm157955lff.26.2019.01.17.00.23.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 00:23:24 -0800 (PST)
Subject: Re: [PATCH 2/6] drm: rcar-du: lvds: Don't fail probe if output is not
 connected on D3/E3
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20190117014946.9669-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190117014946.9669-3-laurent.pinchart+renesas@ideasonboard.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <fdc7ad35-4f12-c8b9-831a-3a92347a4ee7@cogentembedded.com>
Date:   Thu, 17 Jan 2019 11:23:13 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190117014946.9669-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 17.01.2019 4:49, Laurent Pinchart wrote:

> On the D3 and E3 SoCs the LVDS encoder has an extended internal PLL and
> supplies a clock to the DU. That clock is used not only for the LVDS
> outputs but also for the DPAD output. The LVDS encoder thus needs to be
> available to the DU even when its output is disabled. Don't fail probe
> in that cose on D3 and E3.

    Case?

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

[...]

MBR, Sergei
