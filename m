Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769308;
	b=0WPhdodVA9da2TCCnvvz3PSq6V+TprunsHeg8AMzP5IU/k7WfW+XKROMjdNyI9SWVJYV
	 ddoQ/lQyWYqLMhnIzxEBllvxWzneE8SF8uIq19y8DHTxE0tIZ+qZL6lxQKTVcCJS01A/5
	 jvud/H6jGHQPz4BfaOMMTakMCDBbDDBUyNUnT5JO0NQonAVyqC9u/5umwG+Alxil3+r5Q
	 xfmQ1POOf3F+Ir/ayXrKKj9+EKq8JeBqsR/M/POXDwvm+lhS6prTMA2G7j3GAWNnuKX2S
	 UR1lyXNJuLefyR2MWyk7en8gu2ssy3Ame0UQM9AkX7Rq38WFJ7AT/ZJdrS7p6aeBHsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769308;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Bq8jaXTmaTVOm1HnIUBxNvucsMXgxRAtowk44CaD1nk=;
	b=f8rcdiyT2PSIyr3AY1bsMiYk2ZgiekjAGKpDh0fnFFuyz0SXsNZbsYcn62wGpT9z4lAT
	 SHG8v8vAmJh3SeoA9flfQAiW544Br6QjMUdixzZNyenTOYn6mBtjQtyvkN2GwcrZqQ3HE
	 0STmqO06oxQ+nKeO1lMcu57WRejaeFS0WZe/vPwulKWVsG2nIh7QWn4HZD1Hk94AmdrJf
	 LcUwdMab3BBngvmZDcAK5XTgiuabH4qHvOdZ7JLmN4LoY7A/swPxAEIA48nNYgtYV+GCU
	 zAYnwE4Gql98i8S8F1HtYapdN8TbCf/QgXol+laU1OiOrxoaEq6lDsohwBRjNu6aVqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=glider.be;
	spf=pass smtp.mailfrom=glider.be;
	dkim=pass header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=HElqGJ2z;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4sJDkyGF;
	arc=none smtp.remote-ip=202.12.124.140
Received: from flow-b5-smtp.messagingengine.com (flow-b5-smtp.messagingengine.com [202.12.124.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C65606A321
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 08:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50C65606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glider.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=HElqGJ2z;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4sJDkyGF
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.stl.internal (Postfix) with ESMTP id 9AC7D1303269
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 03:48:27 -0500 (EST)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Fri, 27 Nov 2026 03:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glider.be; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795769298;
	 x=1795772898; bh=Bq8jaXTmaTVOm1HnIUBxNvucsMXgxRAtowk44CaD1nk=; b=
	HElqGJ2zQa754E+/KOP9qaMFT5g/tNdPotYxW7JHlg4JA9ScczJn+FMAEAlbxB4M
	7HPGOA9xKPqOuAcFLAjd1LWLINbviefUBTV3bxaJ08unHRKckHL4oloYVhemZa6T
	gd7L2vNWkEKZFseydc0dDFZXzL+OpJPgjvjLpOAVYW2t3zsvJPAXpzt9KGK9vDJ2
	GhFg52hovSlsUB8hJsy+N1Qzw7snG69NvRGrpe6Exjj2NKvINa5IO4k6n+ttNqSO
	1bPzIGzVX2xDY2ld/B6vgl7eyz7PlHuvPk+Odqi/u72loFJnwZL2MrYVXFWS5oD6
	g7UpwpTw6PIHmJGDn21liw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795769298; x=
	1795772898; bh=Bq8jaXTmaTVOm1HnIUBxNvucsMXgxRAtowk44CaD1nk=; b=4
	sJDkyGF0O+xE1jDPWTdsdyULTHg7Dqr5UerGl8L4Qgj1aTJvvtUZTGvW4UsGOC5m
	M3olFvOJJSnf0wtadZKkWcwiXrTK6AI9P0ORCxScuAY93BmRyrIfKNaE6JRuPq1O
	ty/ybsGrhKng//w5eb03leA/83/kRRy4y97R9BhQVGUwdi+z1D/2LwXSD1OPND4v
	M/MsXcTq41utMLmHmCQbvxwD/EOqZaM3jcSDxUQJHyQvGk+UY47p5WAhh7fKEbN7
	+ssZ6Auz/Sabp2bsaeOUHs3Ej12OkdozN+eh0GbA45yolHQY9xk7fWZU81W1Ciql
	JBKp8HZ8DRQrpM6A+fOww==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=glider.be a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795769298; d=glider.be;
	mf=PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg==;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:BFVnwI7hSaAugBrj/4b3fsoKYFPohmBtdDby01xTefLRUGp
	C0nIoCQAU0Pwf8Hv3+zd6WCHSp7dP+RU+z60y83neACOgI2ibec1qlgCh4EIA2HB
	JzY+jih5OJ+GdLY1P5RyavHAwV0LaYhKF5n6mliwjLrcFkIzOwo68Bvk1Uw+B9k6
	/mUJ8Y2APlslLMJZltQvF70//WzP8ZsoPRJx+GbTP6O6rxe2lQNwT5AUb4qdifXK
	yhro87uYBcNTPYSiFQLuOM6RBwoW1m63lfeu9IVP/ARLv54CgoV96nLi+qT8K2Zy
	/+6rVXZqSGnFmoNJNEh0hwrgtmYfzE4nHJsIAZA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:N3AG2/C8mqWvB4VqRP1V/uZk4qZTzDP8pyM9QWTuWqg=:zz2/ZQPdQENkKPfPwdQsXdkq93N8qlJoZ6NJkqdiuIE=;
X-ME-Sender: <xms:zUMJa8mdPtjhI6Xx0k9Ff8uk-i49QEpHduqp2UvgSgtRgeE_pcY-aA>
    <xme:zUMJa2qYRvPbBCN9lrHVf1J0QApl0tihWrqh0x35C4wngSI6Q5ObvrjzozyQeFC_9
    GuyqiIf42t3He_K0y5_c77p2kqFKCvgu-hCY5s46s5PrQ9OC_qkuA>
X-ME-Proxy-Cause: dmFkZTEBLnNiTe1rgsjNPInjInzY6bqlwwtM6YeSzlhvI/+JM1de/m6VxBrof0zrpgtp7v
    6k3uzrnZAhujxkdWLnjBYKuK9RQq0YIuLjrdj/V/QQMlwm6/UTGH1rsW8b4hYxb241hxZI
    3fCZwe6mI3l6jIDIeAsqqaUgSlgEQI1TluQ1X7MTZNRkN6refM5QTKbH+18ND54pDExEjF
    t0RKN+F6AER2azSaLJ/RzdOaEGo8hPGtp9r2h763YNPz2/Q50DVCYUeY2XiGl4TlWlV8vD
    XuDjrLRD0T3LHO+jYRn0z8p0YiP3aEQ2SPPjT/wrNW4HdPKpSALDSigvjncIjkt/ZAQ6La
    Ml+8iEVx+13B8+fgsRQ1lwANlZqKcwvr4C1OEsRmqEZ0JVJRcWV3uFO68OhTo0hSjow+1s
    3TW2IjfWqFJOs+geGKXTUR30kS3Ltmq5KnenIuLE8QFDRfGZc/2RWdLkExo2IWZ4sm6C4L
    J7LNXxxy+c5v3j7OYfc4B40izAsAuoYD1uWMosoTPvjzjRtlr2d67Pso4KZ0hm5JaCpBDC
    G79s1kgXdPjy4KX1NT3n6lp7nAIm1zBjOgmBJVOK6HfXHLX6ti5Y1Ty0ibVeSC4RgklWWv
    JtK9hIt/ZYcKqjgXCsWNDZEhBJLvQDbnV3xiFtXpKUbaXsXus5ICE5r6SAqA
X-ME-Proxy: <xmx:0EMJa2ztwMxcGg7vZYZd2pj_j-B4I2dUPQOXLcC-K9-3obMC6kQB6g>
    <xmx:0EMJa6IpryVyd1yZ8688GuPG9ufPst4xN7Z7Eit3NxQ8CV7_RO4z8w>
    <xmx:0EMJa3ulB_yt3z20rY3g6gJFjWq4GdE_XOEZSzQPU-1E5Io8ujZaPA>
    <xmx:0EMJa0R_o3mPBRuJHvQ4707PQZTtfdWE5VDnitLwv3YAC1-PQDiIUg>
    <xmx:0kMJazDqBMt6szK-c_dGtKcCxgpsZ3dvAKXm8bww8hbi4Suc_ekHaAxC>
Feedback-ID: ia0f84a9e:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 061ABF8009C; Fri, 27 Nov 2026 03:48:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AiqImcDMalZZ
Date: Fri, 27 Nov 2026 09:47:52 +0100
From: "Geert Uytterhoeven" <geert+renesas@glider.be>
To: "Biju Das" <biju.das.au@gmail.com>
Cc: "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Linus Walleij" <linusw@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 "Arnd Bergmann" <arnd@arndb.de>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Eric Biggers" <ebiggers@kernel.org>, "Michal Simek" <michal.simek@amd.com>,
 "Sven Peter" <sven@kernel.org>, linux-kernel@vger.kernel.org,
 "Lad Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
Message-Id: <78b56316-f9ab-49a0-891c-1ce73ef3f381@app.fastmail.com>
In-Reply-To: <20261127083642.131486-1-biju.das.au@gmail.com>
References: <20261127083642.131486-1-biju.das.au@gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable RZ/G3L LVDS driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Biju,

On Fri, Nov 27, 2026, at 09:36, Biju Das wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The Renesas RZ/G3L SMARC EVK uses the RZ/G3L LVDS driver.
> Enable DRM_RZG3L_LVDS so the display works on this board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1057,6 +1057,7 @@ CONFIG_DRM_PL111=m
>  CONFIG_DRM_RCAR_DU=m
>  CONFIG_DRM_RCAR_DW_HDMI=m
>  CONFIG_DRM_RZG2L_DU=m
> +CONFIG_DRM_RZG3L_LVDS=m
>  CONFIG_DRM_ROCKCHIP=m
>  CONFIG_ROCKCHIP_VOP2=y
>  CONFIG_ROCKCHIP_ANALOGIX_DP=y

Why is this needed?
DRM_RZG3L_LVDS is an invisible symbol, so you can't enable it manually.
And it's already auto-enabled due to the below?

    config DRM_RZG3L_LVDS
            def_tristate DRM_RZG2L_DU

    config DRM_RZG3L_USE_LVDS
            bool "RZ/G3L DU LVDS Encoder Support"
            depends on DRM_BRIDGE && OF
            depends on DRM_RZG2L_DU || COMPILE_TEST
            default DRM_RZG2L_DU

Gr{oetje,eeting}s,

                                                Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                                            -- Linus Torvalds
