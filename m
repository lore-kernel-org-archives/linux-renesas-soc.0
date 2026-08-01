Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A7E13D53C
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Aug 2026 00:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785545602; cv=pass; b=AYC0rQ1zZXXGngVBw/0XB0eS8of/ydgaa7KUvXYi+HKY1hbKPxs5BMtGeeK3f4swduieRsfE1m11seUN9Cns2YfA0AQEQ10c2O5nroMvVbj/wkSISeGfH70378bx+WG3xWz+sxe75AcWGncWiy9lrjF4PbEAS04pAb9jRPHcXhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785545602; c=relaxed/simple;
	bh=oUtQAxx6vL2RIVbyoqogaZhDTUmqZrpIVWk2UV+lzdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ef3btfxUyTkXQAghdFAqqquUZyzkmwnVdrLLo/AZZatKYeVeNedItjHPRo5pr/57TqC8Q/9ovyTqd1lpYWATCDcw6g2/h/+YDs76hx+hHThPda/YOLBNpPqxUz4zHSv0DPDHJCG9iw9n6qKpGOQ4yL525cjwQNhHAIXv1TqJmw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwTrq+Uj; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwTrq+Uj"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cacb8416a1so16511305ad.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Jul 2026 17:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785545600; cv=none;
        d=google.com; s=arc-20260327;
        b=KMSho7vwf+rLwP6OVkorKH3HhEPnqpBTGMrEwMv+YETO33Yp6SP4NyAJGyVArFH6YU
         ppeok0HsD17DnjNI53AGBje+NIA7REyyyYlZeJmpE++nXzS45Upwz3wsS90ZU1QWKlRu
         M9E+u0iDxTD4njHRceVWW8RJY6P7Zqs1GqhcIf/a6wkXm5QwbZUCHAXsOgbXRTQyq9K5
         t6876Mz8UUTVpfjbU/oZBkUUnNz2POhShvRVQr/NQ6sBP5942IJqUgC5r040mWYMToTG
         uMHurSQ0gjJ5P02h/R3lSbU+pd9z2c8UfDPWK+44obrNjNWc1pzQgDddFXro7ejNZAoC
         /t6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9EbJUymF7+UOw1oFRaGsp9zLy3iD3uXFjgMX3OKjlgg=;
        fh=hS+m+8SP8a5iJvwhis2uajvw2zqA76nKTW6P590AX5w=;
        b=qucg9yaLDiqG5LdySxwNq4UT57FcJdaaGjub7W6aOYsEntlw9AIZ4EGmRUrj4Dj+Zg
         8bnXxcEtweBFbRrZX7kN3x6dFw7qKwOmPFuadZ+wgoEdec3OmZZGEILtN7nMC5eNlsdM
         KNlK+uz/gj67iA3nzXcSfOXkYMQVUX3Tbc7/UK/4rfkGS/yNwDHbgXGI4CEbLWKSANPN
         Sn0hArpeAkkfUZvJ/GbJs5efK0ADOa4dxY0ajJ0gjzXVdEUKwTiBaTD44NdcN5E5bO48
         dlqKQbF6XpSgDHXY5/kJmtjvqaB3jmpnoVCDGp1OXULkVueuwKnFqCLo8YshdW0jVAGf
         CLsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785545600; x=1786150400; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EbJUymF7+UOw1oFRaGsp9zLy3iD3uXFjgMX3OKjlgg=;
        b=VwTrq+Uj7gcyFQu7TTFyCCQbn9pROiOS1jSAEyPZeOrZgT0q20qFnMAYYYEEdR/aZJ
         QbAlW0V4+kjzyLTCJpOccJMOGMDhjcLR+L7/XQb1K2uhs9KYSX+AJ2nkosdOSfTtRxAy
         vEkoXGa8Jclb4lrmu/BbyZPLwdx7EZ2zDsBjqs7x2CKTX3wCnPJpyeyo7wexLSENSPGG
         NnJWCuLcQpZ2/tOlgLvJhlutvWvgjCzW0mbna06pcH3qRgAXF5FLeue10MNX/nverAi4
         pKCy2BetY6tuBsgyEvA+QaPgv5shzk7UybtZqHhE48DKdSivlk4l+4OntQD+jBV9vfgI
         b7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785545600; x=1786150400;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9EbJUymF7+UOw1oFRaGsp9zLy3iD3uXFjgMX3OKjlgg=;
        b=DEZrtQjV04R0JYKGSv8wSGzvCmDsu8A7FezR1hlCs1QZ5Ba64zJNmP6jCnvEzAhw6M
         B6ELBEvIv8KKePyIr/dU0+ssB6zDbIsT0V58A2yCv6q1pxb+PGCMAfypLHeMkv3Nd8xZ
         5iTcXefC25CN1ITm5Y7n90AVcgG01TZfRnr+I8vAsDK3q6muNdcegCuS2Vo1Au9tkiIK
         Xi2/6RhZbS13TmUNUzlasw9mvqW6wacsXWA6aTEYmQKZYE2lEXxh8+B2+xkh/WMDmWI+
         ag2zUSOlrjUout94v6Uk0iAI1ejzOhqLIKV2gWjwPBAtZkDo33PUq113rA72rChlomDB
         hSQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpl9khIGgLUgvcP/titQbxpy9xZKapd2Rrcdb8N/TvxoqXNok43VDRjqBtAIuhugv6r8B/a91IMOEawWt3imnU9iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywL62lHmcneqNU0P0fgjVqCG/O0L7n2Kw8Q+GPCS1xSISAuST8
	uj2Zhq43tQWagJbzY8UGLaJ6z/fw+FSNBrb9ofDGqm08eXJVYUKUxd7grmNIhrf8BLlzPlxkVPD
	GPGetp9BkZuDoFFS6jvOOTsAowzVA/Fk=
X-Gm-Gg: AR+sD1017v55fzyNaG2KhlQuvqxDV83AidD3KHee8u44abrNHYCuK9BmBckkEkmHD0o
	W7kuVmlZc9TAgJ8wB5baCc4ItBr8Ij/ml/ddiRHzETHevVHUoH1rr6Sf86NZ+BAivaOdK7hx3uX
	slGEP2vJ4RGpRvw3Z3Y91Vkr3nfqxzXeztiv8IoyKZY0Ds1naDUPqdfMnEt3RdiDduLK4eIFbKX
	O37YrMsn7Q8loZZaSPnMIwsgTtycx37V+OJ74l/wMVrFJUjogF3//ZqCD7pRmGtpw8Sv8njsV8P
	LMJop1Zd0/54eoRN7a7nzOIhyibNECMNY8NyaE+D8voDo/UBtlBtPt/unP6NEF9qN4eYt/7FYpY
	2hHG3YUNV5+QwA3nv+QFpv7EfFdorSZaflWriorMrbawPrTmc7Qf9AIbYEQyq0K8grcawpYhcCe
	gtHYrEKeyax0KaUVw=
X-Received: by 2002:a17:902:d541:b0:2c9:97a8:aff1 with SMTP id
 d9443c01a7336-2d0523f6632mr17715015ad.42.1785545600095; Fri, 31 Jul 2026
 17:53:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <d5ebcd52-580b-40bc-81dc-0a9b403e8392@sirena.org.uk>
In-Reply-To: <d5ebcd52-580b-40bc-81dc-0a9b403e8392@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 1 Aug 2026 07:53:09 +0700
X-Gm-Features: AUfX_mwpBiIC-LAm7DPPHKlIG_sYNWPv02mGlSPv-uPLw52OHrWaev-lmAvMvpU
Message-ID: <CAABR9nEKCtmkt1H+qe5UAf42MncOpEqX+pZ-AySTSBQ5Q3URTg@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] ASoC: renesas: fsi: Fix system hang by adding
 SPU clock
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

> This doesn't apply against current code, please check and resend.

Oh, I think I already sent a v6,

https://lore.kernel.org/all/20260609113836.45079-1-phucduc.bui@gmail.com/

and most of the series has already been applied for 7.2:

[01/11] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
        https://git.kernel.org/broonie/sound/c/955fecff55c3
[03/11] ASoC: renesas: fsi: Fix trigger stop ordering
        https://git.kernel.org/broonie/sound/c/859efe92b0bc
[04/11] ASoC: renesas: fsi: Move fsi_stream_is_working()
        https://git.kernel.org/broonie/sound/c/c9e05e2fa089
[05/11] ASoC: renesas: fsi: Fix register access from in-flight IRQ
after shutdown
        https://git.kernel.org/broonie/sound/c/e813df3ef529
[06/11] ASoC: renesas: fsi: Move fsi_clk_init()
        https://git.kernel.org/broonie/sound/c/cfa1466e6dfd
[07/11] ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
        https://git.kernel.org/broonie/sound/c/5fb4660ce59b
[08/11] ASoC: renesas: fsi: refactor clock initialization
        https://git.kernel.org/broonie/sound/c/2330e0b49f14
[09/11] ASoC: renesas: fsi: Add SPU clock support
        https://git.kernel.org/broonie/sound/c/39033b278f9c
[10/11] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
        https://git.kernel.org/broonie/sound/c/05e1ebfeb726
[11/11] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
        https://git.kernel.org/broonie/sound/c/26deeee42f4f

Only patch 2 is still pending, and Geert is planning to apply it for 7.3.
Could you please check again?

Best regards,
Phuc
