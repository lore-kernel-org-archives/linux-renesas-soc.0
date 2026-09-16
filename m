Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58684C651C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 15:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573244; cv=none; b=hlrdBpZSxZCEfzv223hUjsN2r7ruMLPlUNqxz/HFIXhT7d/6CB+3VgQA0WQgccmd9kkkVQxf6nBZ62fS5N0HjAAmw4UfPC7aGVnwnQSh0eeqD90DuHz6bZk8Xo7aadHOAPepqEAYQ3huVUN1lcpeL9awpRvY8ipjBx5yTtKe4JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573244; c=relaxed/simple;
	bh=9pCihnM3FbjYGVi5wLxsUnfSo47K2lILwYEk6sdnzaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecRTmbSHg64tduNmNIeR0pF9sgeAq5tAiA0F3XcjFOCo9yfiKe0RO50WHpw8zoYiQTeh7jThcCDmpwOztTnV394G39QNjiAi4LCTyoqR7rF64yLy3DXnkqSkTcYT19TQDsqYwd47DYnqZTrgZbTu0DqtHpVKi3EVVvkTiFbYiP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c671456e25so2195403e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 08:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573239; x=1790178039;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fboq+NK6sE1xgxN0EfjzW/gu4Sq+vQLBzrzcGneycFo=;
        b=yaoXmtkKITM7PABXgcn8voEtYEYr6n35c5uXCjKNKZHWWEwFRYqcn7m65YnjDUs3qd
         cM6TIMV7LN3yTze8Wyub7JEnpluoMuBPRinTiJGILoEbHSdLWfqa/tbkoPAR7VaAlaqo
         RfUPMohB4ov2FIBYlRCqmzRETCRqg39nv8CJC9ks5weoqWBjaKm/5TVDFFGiHW9WQzJ6
         /R+ZuchJzAdaO+8aKqyFMu8LCCjlGtyVMvCZp+cbcrPHcMYPqxXdqXN9EVI3GGBE78cq
         2vqrMkTD23TR1eloZqqNBjMJTv1QDU323erk3tIksXEg+S2MoGyBC/UvLurY5hDRBTPv
         7MCQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1DV7VPFbtO4DxEGPi8o2BMSHQ11BIGEJ+GII6ZPrjc04T6YqLUYdpwGwjczFIMKOdmxmiMOMr3x173zdigkAZow==@vger.kernel.org
X-Gm-Message-State: AFuF++l9MhQ3e4jLdz8nxZpsEC7lznVMsLGI0t4Naf1/dx6Y/S0TYxym
	IWs4OOs6lbha1l4i1rw2tIOI64pv7km8jsGeHA9zTOru0ISykl3KdI7LCDLlOwPY9ak=
X-Gm-Gg: AYBFou0cXU+FDHIGC+7cY6FZB3tH7CH3eOIaUDl08h6P8+olpQGTLr/WJBRIPjAu8aP
	n6oFtf0NgnqjL5GZYizCxNHgjtegdKONdaia05pbiKdRdIMWipVZixnQ4KYOnJr0GanuP7zGB+i
	LgEg5ZFOkkpXShLisnvQ+5axfw/vOuO+OkIuo0z4xCG/nf9w4h3z7eGU5SF9Rs7FjVEvGGcWhdM
	AGblXeRIoEVMKmIV8ffYcyhEBgvAg7Wu6+HFuTz0oV8AUGW8dTS67nTi0kAZPyzyhzgEbKW2BWW
	vSNpFkdPuLbjlEAuRWd21fZ245wRCV9Ol5JW+1FuHESXHuJawnJxTcRQjSI186dxaU2oXgKrZ7U
	lybHwkcAaQrpcE653XmQRr9m5k7mrBKb++gz/zflJMRsxds6u7x+88XRR9xMmEl04hVZnxc3FHH
	F3Esjqlxhuva1hMn0qdzZzbCuTpXGUJ2nAvBVCcpHXBuUu0LAIQSqaJA6IEVOon65OZLUDcbbi4
	RelRqZnlwU5xFjz6Ts5D7Twqi2GjzLqIMNia2n3
X-Received: by 2002:a05:6122:6d02:b0:5c7:dcaa:980d with SMTP id 71dfb90a1353d-5c9a559bbdamr63608e0c.1.1789573239568;
        Wed, 16 Sep 2026 08:40:39 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9a545f3e7sm52758e0c.17.2026.09.16.08.40.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:40:38 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so1698511e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 08:40:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy52uabpZXwQCBE0swXEvIac8gzmUSuBpjTeV8ecMmX9PBS2gMgGotDEmemp+AzOjFC3mPsAeOlt72PbJMO+qbxbA==@vger.kernel.org
X-Received: by 2002:a67:ec11:0:b0:797:c1fd:9d87 with SMTP id
 ada2fe7eead31-7a1e7943469mr59486137.2.1789573238729; Wed, 16 Sep 2026
 08:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87bj9yvu5a.wl-kuninori.morimoto.gx@renesas.com> <878q52vu4q.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878q52vu4q.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 17:40:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQUiofvEVwE-ShW61nEudqqKd-kYR6yU=yQr1SpB+rEA@mail.gmail.com>
X-Gm-Features: AcwNN1WZzoCkTGlVWoKiyI76sQkG1ugXvQ56H2D2SN8hXm3ty3CNS1u79jGX7IY
Message-ID: <CAMuHMdWQUiofvEVwE-ShW61nEudqqKd-kYR6yU=yQr1SpB+rEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: r8a779g0: Add ZG clocks
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Anh Nguyen <anh.nguyen.pv@renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 03:54, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Add ZG related clocks for GSX
>
> Signed-off-by: Anh Nguyen <anh.nguyen.pv@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
