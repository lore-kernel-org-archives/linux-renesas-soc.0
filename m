Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE2F40EBA8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548347; cv=none; b=kBELAMoP1BrYPKTpEYQC40gJ9I/A4mUrofr+ZCf5riGaUtqLdCXqg/w+RHtbL2bGXg5XimBX9QhIOs4inXzrGe8DhVv1tixQpauWb/uH8xZP8OZFPg1JNV746vJ2T6Es94xb1v4A27S1amB18Ja2h7Ui/aiJLDDp0EvXQqs87l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548347; c=relaxed/simple;
	bh=1Jx610SeGgFkLwKjerUyHY3s0tTgPNErbWBGiiSj1xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c81BNMDgNG+4A22stwbiy1jCBnT5msEcDD9nHMNBoxEs2KZinycebE/bPXqud7L6HzYkbL8wLvnZ4V3sPX2U9nj0yvuiqqzT7imjo7zeNwkSQNNRyAJsDH2eg4pCzkL45eSUDERJ7tjG5WwHLXu3UVGRuFz+XOVg7kugapUIUJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-969524c1a63so720363241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 08:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548337; x=1787153137;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XymJk8W/W4pkTIWis5GxvoRmhCk8uai40sswZrGrkUI=;
        b=HRYZjbOgHQNzUAc5jE37sT5kO0bSlB5WMojuo4xlCl2dKF6ebnT4duPz40GZcPHsSx
         GBtqPfy9fLt5LGKN4kaxHnsTJ17Xnc/ezq7aBjUGYR/0bGhSTFIO+Y8vxq8hFK4aeVba
         V7UZdQ2q3U6B8qVPqAp5kvr7QmB8jZHIThyX9yg6sdoDnAUbDDUMP9cGDv8epqSTSmOk
         GTOnqtxmySSfT7i3IcHYmXvt+y8nnCkZRW3isWjjU3OSqD8AXW92UPkm33nz5a9RWjoC
         rX1oi+1zIByTK5nLk5x1oueVvrD+Yo2gZdkVhgy7ZpP7dGWR9HD9ujyV7WRzxKtpogbM
         pgzw==
X-Forwarded-Encrypted: i=1; AHgh+RojVrGkTNbzJtsvUrZ5PGVw+v3s6lsPUzXkyQoS1j620rTHEGJI/q/n7sCo/hGMG3mH5T9wxSJidA7N4Bt7BBvXEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxD21JCsowjfka9TSJi8zO4WwATwc9ihIxRH8XNiIu2bs83fYb
	BhSYyxvRpmOpW/LSDnilnr4ADAKOXhUeKgLoBpDWkcwZpavOrvP93qB17KKb86pS
X-Gm-Gg: AR+sD12kGJFUw6h8pPTc/qwh5tbfDj0TDyFXuiEhjRPuZNvIdmLs8jO0A++DbPqDPa6
	S7dzVhhl9lR203WDdjb3QPTt7YsSY4qAOycmHXDTqCcHkSxI9Ga4n5qy3uuLVCc7i/vBdExeiES
	tj8AuUmxEieCAdsQByPpYTJXdcG5S7n/usjI6pPFHhrh+bpwrYeux8f47+S3u/O9yfHTvUhYWEI
	qnt0djS5Q1mzOohpsUvJIpp2MuV2ZhnXiUVZDXiuL7C8qbVUFpXL1S8/1/U2PZqSC9CrVhIyW02
	Bg76noHnMfvc8zuUQjymAFBy3C76ZY+JHtS6f7nL1GPQcS5nrvfwjls2fyDTiQ+W/5hsiB6SMlo
	yOhpRMJ8RnPgcUiS2BOaA9y877yTIWT+vaiiMujm7scix7V4b9DCqKSRz7cKI3qGlZ2JUh7c/JD
	NA9VjeoyZ4OtrVqwhy+3C5dNkyZ/l8wyI7SdHQnD09EWqa2WfBOr2wSD+RroFRUPTJdRed2dNG/
	vIx89puaH4L+l6nAwKoCnFdiw==
X-Received: by 2002:a05:6102:8090:b0:73e:9fae:5845 with SMTP id ada2fe7eead31-76c8463a175mr1600584137.0.1786548337273;
        Wed, 12 Aug 2026 08:25:37 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76cb1a2b77esm888845137.12.2026.08.12.08.25.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 08:25:35 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-746d77537f8so573807137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 08:25:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq3HWuV7tXwp6SyGqYIFQQMkin9n7n+DjMmWZsESiyBWoj70qZ64vHwz0JnufMY+kHglz14YK8UJ3foTXTKpKGhFA==@vger.kernel.org
X-Received: by 2002:a05:6102:6896:b0:74c:7fd8:73f5 with SMTP id
 ada2fe7eead31-76c8885783dmr1566195137.6.1786548334096; Wed, 12 Aug 2026
 08:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722085353.136986-1-ovidiu.panait.rb@renesas.com> <20260722085353.136986-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260722085353.136986-3-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 17:25:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXX5jsJmsDxdn-A7J3ELCO84q92H-xvWSVRnFiCkn_=RA@mail.gmail.com>
X-Gm-Features: AUfX_mykWtnGd-q1mRUf7k7eCfAnrFs5cG6noTRZhpPIlC844JZzbIN1LhoykkE
Message-ID: <CAMuHMdXX5jsJmsDxdn-A7J3ELCO84q92H-xvWSVRnFiCkn_=RA@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: r9a09g056: Switch GBETH TX queue
 scheduling to WRR
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 at 10:54, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The GBETH ethernet nodes don't specify a TX scheduling policy, so stmmac
> falls back to Strict Priority. In this configuration the queue with the
> highest priority gets all the traffic, starving the others under load.
>
> Under sustained UDP TX load with multiple data streams, this starvation
> triggers spurious adapter resets due to TX queue timeouts:
>
>   iperf3 -c <ip> -i0 -t60 --bind-dev end0 -u -b0 -P4
>   end0: NETDEV WATCHDOG: CPU: 1: transmit queue 1 timed out 5228 ms
>   end0: Reset adapter.
>
> Investigation shows that only the highest priority queue is advancing
> while the others stall for more than 5 seconds, causing a netdev watchdog
> reset.
>
> Switch the TX scheduling policy to Weighted-Round-Robin (WRR) so that
> traffic is processed across all queues, eliminating the stalls.
>
> Fixes: c8c8a57c5b40 ("arm64: dts: renesas: r9a09g056: Add GBETH nodes")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
