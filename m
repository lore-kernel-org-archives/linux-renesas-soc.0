Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712E0C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 10:48:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E37221871
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 10:48:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="bsx8eHj3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbfCOKsS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 06:48:18 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37486 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728676AbfCOKsS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 06:48:18 -0400
Received: by mail-ed1-f65.google.com with SMTP id m12so7211068edv.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Mar 2019 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=KuZv0S1tjaJAsiqq7PjT7EfO6XTWwwtL1h2LSortnxw=;
        b=bsx8eHj3Gig6PPM0vBCI2pOLG9aSNoSrJGr9JC+Ln8AnmzzS0alpR6FirCwPb7w4hh
         G1LZCAjm59Judza/i2vZcGgD8CKG/nEz/y8ufTmNlFRB3pTFRbb8OvLU30/4Lw07ki04
         yoQMDSLiRHnACEC7gEv//j2z5QWRx+gLelDTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=KuZv0S1tjaJAsiqq7PjT7EfO6XTWwwtL1h2LSortnxw=;
        b=W1wnVCVcnr6YgzTeMyINBpyGT+wrxNU+Oz+DvOneIzzekbeTRX5zoDWB+N23uz8PBI
         zJlfxInGHBnq6IleEGqHEu3JfH+b3hTLEAy+GykF9YYdBdaudHv44xKR9c+5Guh2cRVt
         opF85+3CJOhB+eFq//gJStbp0vUSL2guamuxoPRz+iPPEY+5RAexGxC+MHUygIId7M/b
         z1N0bFWXnn9BZs0he+FZCrx9xKYmd2oO1Qt35XKT/yCP4Qisk50/6ZtvbW1iy4cSETNB
         HBt2qpCXVn+eZCS/vAzgysbT33nlTqVDi5jQ0HsDafcK0Hoe4LKBBphWlxHUgQ/MJKdf
         gDbw==
X-Gm-Message-State: APjAAAWFlTR3Gzc/kvBSBlOnburSkxX82EqC4yHL1PUhO24CGk4RDEIt
        sMPg6KEJ0chJn5qp4syPb9imcg==
X-Google-Smtp-Source: APXvYqy2TUaPKeC+JB4jyYCjEdZxgIzSE+HwlgPv6i4+Na2CHGUhGnYtbIpOC3i7RyVkgcfgAukAKg==
X-Received: by 2002:a17:906:6991:: with SMTP id i17mr1826610ejr.96.1552646896740;
        Fri, 15 Mar 2019 03:48:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id c8sm335077ejb.9.2019.03.15.03.48.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2019 03:48:15 -0700 (PDT)
Date:   Fri, 15 Mar 2019 11:48:13 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/3] drm: fix subtle spelling error in drm_crtc_state
Message-ID: <20190315104813.GT2665@phenom.ffwll.local>
Mail-Followup-To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>
References: <20190314220420.32487-1-kieran.bingham+renesas@ideasonboard.com>
 <20190314220420.32487-2-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190314220420.32487-2-kieran.bingham+renesas@ideasonboard.com>
X-Operating-System: Linux phenom 4.19.0-1-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 14, 2019 at 10:04:18PM +0000, Kieran Bingham wrote:
> The drm_crtc_state documentation contains a subtle misspelling of the
> word subtle. Correct it.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/drm/drm_crtc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 85abd3fe9e83..f2b3762636df 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -78,7 +78,7 @@ struct drm_plane_helper_funcs;
>  /**
>   * struct drm_crtc_state - mutable CRTC state
>   *
> - * Note that the distinction between @enable and @active is rather subtile:
> + * Note that the distinction between @enable and @active is rather subtle:
>   * Flipping @active while @enable is set without changing anything else may
>   * never return in a failure from the &drm_mode_config_funcs.atomic_check
>   * callback. Userspace assumes that a DPMS On will always succeed. In other
> -- 
> 2.19.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
