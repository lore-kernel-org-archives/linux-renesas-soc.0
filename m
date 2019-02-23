Return-Path: <SRS0=cYIn=Q6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C96C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 23 Feb 2019 01:45:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E17A0206C0
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 23 Feb 2019 01:45:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="CM6z72CT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbfBWBpy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Feb 2019 20:45:54 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44103 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfBWBpy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Feb 2019 20:45:54 -0500
Received: by mail-lf1-f65.google.com with SMTP id g2so3085655lfh.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Feb 2019 17:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=t7Nr7YA0FZnqEHzEIq2JrQfxhnPVlfu/7JGESE0K9/Y=;
        b=CM6z72CTyGSTezk2kD60ON258QYdybTAQcXayNM6p2nba5mCrUi2rqWQ5i7swFdhEn
         YDY6zOP2tJFTXd0uAENPN4kquveZN8EyPD1qgVxaM/d7M7P4jlwZYs3RBqEcizuCTh91
         mMDuWHeCUFHyKh7aa3rQtl8JzaJPrhFbsGDF2VEtcu7sWmwAYm214Wc6GISyIglieUzk
         6oyvt+cPy8ZJVsm/hSIIN3/HIAnZE9t8MwyDAvmG89dAnTKHe0UPkgSdpcLoYLFaTOzf
         6CmAvgXEoyppCevQrNmk/LSGQgoFxvK517ftFobAVVryyX2R7K1DnpM3AD/fDknFn6Xo
         4I0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=t7Nr7YA0FZnqEHzEIq2JrQfxhnPVlfu/7JGESE0K9/Y=;
        b=O10yv21Qhu/B44Gaio3/MrMYIqIOmmJevpykFrp0pE/b8vG4fqENofKNYxso5lJKxI
         j+ebdiVS3WB8q4+75s763wtcIfmc8ByLFa+Uvk1vSUNl38FGh50xSKO8WvqGaS7BA+Gy
         u3OtjDYqbnu2nk/rkqSw69ZnLOSWTLtiqfkaaGuOyqyd+//ObocXv1DAsbh1h1wIsGZa
         NOwPriJKkCA7geMkduNeuDBJ9IEGG4apg1GL7HbiG4Ujn0mxTAx9kqmvI3pRTT5I3w/h
         m3bWHzkqljGZhMdUYWXiyFiF86P8pYSeYvTQ1ipYsEja1mjvwj8ltJYcWoPOomIh8sRS
         Wp5Q==
X-Gm-Message-State: AHQUAuY/LbMCURb78NlRzD3dIw2Z3C46wDjBUHK9unXopbMUEkafCjFa
        /X7+YMeKD1chFwNxURyVNpGpsBU1ldg=
X-Google-Smtp-Source: AHgI3IZuj3QrhdgOV0D9HMhQKSNLh3MuvuCsu/ZBO8twcBhd68P0V/6fYjJnN4zsngp0zRTdz9Rmzg==
X-Received: by 2002:a19:fc12:: with SMTP id a18mr4022387lfi.74.1550886351892;
        Fri, 22 Feb 2019 17:45:51 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id u11sm954875lfb.85.2019.02.22.17.45.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Feb 2019 17:45:51 -0800 (PST)
Date:   Sat, 23 Feb 2019 02:45:50 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH VSP test suite] Remove dependency on a particular yavta
 branch
Message-ID: <20190223014550.GT11484@bigcity.dyn.berto.se>
References: <20190222100257.4847-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190222100257.4847-1-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thanks for your patch.

On 2019-02-22 12:02:57 +0200, Laurent Pinchart wrote:
> All the changes required by the VSP test suite have been integrated in
> the master branch of yavta. There is no need to depend on the vsp branch
> anymore, remove the corresponding paragraph from the documentation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  README | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/README b/README
> index 17920ee663c8..0d5a6967d7f5 100644
> --- a/README
> +++ b/README
> @@ -45,10 +45,6 @@ system in a directory included in $PATH.
>  * raw2rgbpnm (available at git://git.retiisi.org.uk/~sailus/raw2rgbpnm.git)
>  * yavta (available at git://git.ideasonboard.org/yavta.git)
>  
> -All but the HGO and CLU/LUT tests can be run with the latest version of these
> -tools. To test the HGO, HGT and CLU/LUT, the 'vsp' branch of 'yavta' is currently
> -needed.
> -
>  The following tool is additionally required to run some of the tests. If the
>  tool is not available the corresponding tests will be skipped.
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
