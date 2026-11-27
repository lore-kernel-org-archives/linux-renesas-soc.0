Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768100;
	b=K9jKXdZYmKnS+kRDJ2mCG38THFOymt3ebhoDMY+c6cdO/7G3W14kMJDF4EaMptxQMt6l
	 6awva4y9J0gzSrtBeqMf6ztHS7rLvzz78yICkbGuVefHNfsu9caNRJ/WXoKQA4dH8OunW
	 poeCmBYEhD5uIO4f8HhqKrWwBCW6Ia0ND2jsi6zQrZQW+AGdyxaBGzHFV030aF6hVQjU1
	 gA1qcl38LiF/bioFlXro1DWUmmM7RIRHmXajZWQLjC657aoeCXPCs6IG5hZuqDCiviAny
	 p7986tMSxEspeFy3tihX2TDUtsquzI0OgWWY4eT+/DfEgQpuzXlEB4EjIaZ92tfugLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768100;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=PHoEsBWMB/Vv0GOcIoPO7nCqnHKlQq/3bEMPvkd/FSs=;
	b=sDeMW3gpr/AAwcUodQKD6RGWOLlpMx9/9Gl+6SAErHhqd6C0xydSieJgW9YUaEA7uOrE
	 hAZMLkLPk5c7RrCggeLqmxk4szKagJAZYu6zcl7ZQMa5MwQCMQbnl1S+/jW4krbKmEBG8
	 YSTOsG1ooKGRuxrN8fpnURqpCLIxI3ElRNGNz0CxSiH2TrjQcK6WZbDCzm1AKRNjIXIeK
	 8uYFySDbYPwskmPUK88/YEfb+B66NYxl/B+j3QndP0MQ3Ds8aXjUlLfX8EDsH8MM/74bm
	 iylusH2H36HuS0K4NGDRpq0a+dRq0RipKSR7PCBP24MPQVYA8cF0ZIjhRAN0hfeeBQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=glider.be;
	spf=pass smtp.mailfrom=glider.be;
	dkim=pass header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=CgA0O09R;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UgohNIFo;
	arc=none smtp.remote-ip=202.12.124.140
Received: from flow-b5-smtp.messagingengine.com (flow-b5-smtp.messagingengine.com [202.12.124.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EC6606A31C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 08:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0EC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glider.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=CgA0O09R;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UgohNIFo
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.stl.internal (Postfix) with ESMTP id AE7731302E45
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 03:28:18 -0500 (EST)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Fri, 27 Nov 2026 03:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glider.be; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795768095;
	 x=1795771695; bh=PHoEsBWMB/Vv0GOcIoPO7nCqnHKlQq/3bEMPvkd/FSs=; b=
	CgA0O09R9B1wAsYt5vMW+n0K3Mad5pEsbaLPJxh5NEZ6ybivcqb+8fMNsrzKPPx0
	li5wRaRYnAPti/HyxLIa4asBvV27eOZga82hGNR0/RPNuRayCEGxEYocEinvY+36
	cIQAvRlZEVkEUIyO5DzIpxsK5jDFdsnKdVwUoyQRLn7AL4Jsf8NmG5J6qlgYCD+0
	dQ3UBNaqb7d6/PdNQB84V0o9DW71bDKyiCfw8kX+bsB4djkJWmuFgYqMJ3je/MgZ
	Vf0TlhMS74XJdrnZo3GIdmDWPF96mHlnOOxOe8Cr2SW9sWBt6NPKP6f6gmiqBzR5
	YcJ9Jgb7uFUYlPPHUurPIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795768095; x=
	1795771695; bh=PHoEsBWMB/Vv0GOcIoPO7nCqnHKlQq/3bEMPvkd/FSs=; b=U
	gohNIFoNQvj6IKovQiP+hT6C1JbeEepAZDWci5u4cSRg9TTyoBKfqdfQx+7tR0W0
	3EMN2uxAJoOsEHDA7AFKYyoJeoMQejixX9SbCDLNiJC2lwzHtgx4jDlh/ZXrSV76
	/v58Dw7xTpqSJKKkb3OH26RVJgJLIRjujC9wbnxwbEiV4/MWIP+vATKFxLvfGwF0
	uqWZewL5B4npNaZdFTpYssfj1dgjaO2LB4OvJDJ8k7DNrXY/wJ+TaatiG2xuRwyI
	HiF9Rgg7PcKQeURBLfe9tnx5gv+h4zqRag1S9t1ajkwEY+N4FLSi/s8BAEq0Iav1
	0JbohXG28Za57AdDlRSGA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=glider.be a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795768095; d=glider.be;
	mf=PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg==;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:SshXiGV7NBYSY3nF11ecRcLqgsvWfnimFGiDKGp+bEpPTnQ
	67g6tGDj2Y1+XAZLGmTPOnm46XzdyYWdtUUy6JRtAuuiCqrV91r3ZBh+0Kq/B87T
	T0F7nnj/5TIDlEacKBZ1TLzgOa2QMQngHbTre2i7DpL80Ns36kEPAn/wHvzTf+Bz
	sGt/p5GM6ReGTh5oqxbOyu8ZDzyPGcljeGysSvbym8tuAbXagUrkOEhgANzAz0p3
	32qDr3T+4qwFkpVr8rSOW9k1fg8kDj4w817Ym3o7+a/MzARzkmJufcQLb61s63on
	pEE3Ujld1eHLlnRc5kIHlJr4EGie2e9P8wIEmvw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:JQ13mwjQSnnLHD1U62VcR6g8sa4ICjl/rw/wjbS6sSo=:Lssb4J0SX8nLPBA/hS+IhV4CtK40HRDJSmlj0QhTAts=;
X-ME-Sender: <xms:HT8Ja3j2onYF1zMx37E2Xc4ubQmqAd4vtD01JQqLr4pDq3X_SUUFqA>
    <xme:HT8Ja-2UAQ-4PVSUJRnzKhJpCcI7ggon8Yh3NaFPQzS3y8_EDNse0aR5fKUBaFQfX
    L32Iajlzla21vmgfmnr_GjTkXwSXcEMMMKw-478T4elv1_07ALpiag>
X-ME-Proxy-Cause: dmFkZTFfqaFfUznSGYVQzFKOKxtdbFhsMSVBQf++tvRHuXGvItOYHDFSDY8XW5MZY9+3hf
    ml8dFqH8O0n0MkeydhK5lCwkEhJh5RN6ZKhOtivXegDYl0PQm7EcKHVf9xITCeFhoWlBUZ
    6veNHka/krOgdCogNZaZyeDaAXjwslJyceT5LdB37IL8GYDS6ZsyhFq5sx/mZOSoPBgjPl
    dY8C/rbGtIs2QaYgldSan3axMy67PzXwZQC5CGBHF08WipD18RrpX5xzNCy7iWYvKptwgf
    OrAcy6i7UbPXt70OKhmJ2BAbEPRQsLi03Z55Jymsr9TUg1jMIyP3/VSTvgwPYbxTLwK1Rr
    DYK/JJzRIGa0UlN9EkPsDIg5gjhGeEdTkx0LGjtodDblGIMGNvKwm/HYH5WEJDAziiukj7
    UEkk4Ld3GFsiSaP019OFn7vtIV+RbUr05zCv3Tbqe73XQo/BetuFcCz5uzvui/l8ioKfNe
    c/o3ApHy7MVL9tc4bYFu8lU3W8nyWmXjB/L+8HqTaQA/6zKH9JOqI3X9a46nK2NdQmW1So
    cvF8bes/j/AiZVL9u3JhbMPAppkj+xLjIAFpk7S0hWwk7tVsK7ZF85inSfRUkup8xNMq45
    93lcYnruNaDVeD0U6dNeRzFmwGeAwypkOS3vFvgfa+rc2FJfDZfPN1sMsV7A
X-ME-Proxy: <xmx:Hj8Ja1JyHXttPmk-uFm4N9eqnrzQ5dpdgL8CmflR5cmZaeTSAv1gEg>
    <xmx:Hj8Ja8mmba4R1dgpsgiyBOBpdsLCiQgHB108mVK8jxIk7qn79SBv6A>
    <xmx:Hj8JaxOtv1-VlBKQvrfE624KoOP3J75kkF35sRYD2dxdSEL_mkN19w>
    <xmx:Hj8Ja62pzBwucNP2LQlm_wjd-sNO-G_IQdgpd7CoREC5ncTLq8ZaPg>
    <xmx:Hz8Ja7Ep95q5RNLCoAKL2Fni8f_KvvILT_DPJQRFbpTvkrgy--Vqm4fA>
Feedback-ID: ia0f84a9e:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 7884FF8009C; Fri, 27 Nov 2026 03:28:13 -0500 (EST)
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
X-ThreadId: Ay4LnPi-Nlx7
Date: Fri, 27 Nov 2026 09:27:53 +0100
From: "Geert Uytterhoeven" <geert+renesas@glider.be>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg+renesas@gmail.com>,
 "Lad Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-Id: <33ce3c55-4de0-4639-9860-1d0e0c43f9e4@app.fastmail.com>
In-Reply-To: 
 <20261126215839.2473086-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: 
 <20261126215839.2473086-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH/LOCAL] arm64: renesas: defconfig: Enable MICROSEMI PHY config
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 26, 2026, at 22:58, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> RZ/T2H and RZ/N2H EVKs use MICROSEMI PHY enable the config for it.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will apply to topic/renesas-defconfig.

Gr{oetje,eeting}s,

                                                Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                                            -- Linus Torvalds
