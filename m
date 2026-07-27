Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F833B3894
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 17:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175152; cv=pass; b=QmzYvforP32LHD1L9L/Xx7lhB2c/8n4Wh0YvDb/pdRDvu9vHaXO0RwFcQSwkvZXIYnlXbRPMmEUn1Dz4vYD6Er8qe5reoCwEyOfaIwfCfGQqAbUrY1BJm4xrXRTjANGZzI+Yws9hoqZL/CIvsB/s9uKpojCLcUZvZenuCFCv5+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175152; c=relaxed/simple;
	bh=IlMPunhOQoKRntZmtNY4UqQ2ccSCTkYXSC3AepsSrEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEN2iDkwv0wA/+jCbmpY5B2sv7HmNCsNR4gOKEphceayy8rS2NSrXN/cGXSd6j+Usdb0q8JuqsTkISr1XAhJ/1AGwdRSHzJGHt6HLTP8dJzNXShFghFYTpUlVnJXZUlVB8Lc9JpM/pwkmvyKWvWvaHWaQNvYVJGzTRh4y3lAUd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVoa4UHI; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVoa4UHI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1828838f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 10:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785175149; cv=none;
        d=google.com; s=arc-20260327;
        b=dryVN/N0dgeB//9TprXM3XEHg7NkRUPQUS7+tskRJHjWDecXufdVVnJtTnXgDvA7mm
         UGAOapeZp2RWusF63BoehPVEw+zfI4A+1NhFMoxsE6t8t4iXnLx85VDO6fUErvGZpKfW
         p1xAaIEXlKy2NDctcCTwIkofeBdI9KxdzD4Gm2pCKbHwcCJoQ05Ake6t5Mmw2DSk9e5J
         Oe/ECo1xPlTLK8jXRzWnhoaNiV4kEUiAcWpbZ5bkVkOgM6k5lSU7242MOZG2RsmM/Cvz
         Sh0LDWSc6dMYntrX1I8oSKeUiVQavnOQBBlyIO02x0dWT+tBWUl6PJjZXZyGt0FnsNEj
         kFLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IlMPunhOQoKRntZmtNY4UqQ2ccSCTkYXSC3AepsSrEw=;
        fh=IjZNWgzVcF4dveyJh+2FS7bJJGrTuJSPZMV6bJlEYM8=;
        b=BJVYpXRKRnzvxK4HIefiL6eijKRyUTxQIvIF1W3X7yy2yC08vUL85INST+YQUyP55n
         XSKaWQ44vtjC9jCN8du+41PLWDk9QtyDen7fzgxmlsxE8FTbVXA2MX5hLeIwS7GL2ELU
         YJLlrI9vGrgb0Yspjo9DZoQFYHmAvm8PLX+g5ij857e+DB+0cE/dDSfSkrLMIvmm+A58
         8Ko0i9lAnRykOcfvzMXGbw4MrN/dNKpkM3LWsCvBcA2wnNNRamzYh4r4QFjiiM3Zf23O
         2MWn7H/XVC0Is1Lc9xVE5wQ5VARVr8GUxXlOb/wI6qQAb7qRdPWV1FFDS9j0xCosNr/I
         jZtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785175149; x=1785779949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IlMPunhOQoKRntZmtNY4UqQ2ccSCTkYXSC3AepsSrEw=;
        b=hVoa4UHIlSiGM7c914yRJk7A52Y2qilbXJBbOPnQQBTXlJzDSW5/zBNhu4YM7OrMDv
         wLmyX3fOTa2mNupCPKEc8LhI4I96K02t7LWFNqfRIyZyz2uUieES9HVDSexvTDSA7Kxs
         8IcscuPuNvEz5sMj5jcbCYm2XKBIui8XEvQc3kDV4RyuKgvF4S/QOSJA2uUJNnpmOHHD
         rstzat6PlF+5BGxvtTQd2zK1d7/XhIeF6TLPDSWw6wn3nad/hXw2CKwp2CNEvg/xZRbP
         fdAbaef1YcwWzy1Un2D26XH9yD5hEci2awXZt2nCOF1uMO2ow065+tzdjOennUWVt1lg
         Zk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785175149; x=1785779949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IlMPunhOQoKRntZmtNY4UqQ2ccSCTkYXSC3AepsSrEw=;
        b=CX+BNmi5EFuA95RvWCmfDvzonthxdiU9lOFYv5x+zWCtzXYIYyfBBlQaugUw7kBV19
         KXW3hWuKjN7sTAo3NDtcjjsXodqcbnIxdRPdUeOeK7QdPb4PLS/6KVIMsgDZNtvf9YkM
         E21SOAp8oE2HsYejMe3w1lPNXR40Uia7l4p5ME0Bl7OAj7fjyxe0M0UDz7QJz0TmvmbU
         7yFQSXIWHdaAhzaT8II80aeKMEZ/rJqjRuq3urzjDnjZHD5eqYPGfCeSTa1B+bDn8+8k
         S+DroiCn3KipyNoPEagKUDRrT/lnTZrAnM+VjWUUm9Djd10OQuMyGnU4aXyrbqkLSoP3
         rMYg==
X-Forwarded-Encrypted: i=1; AHgh+RoHzJQE3gwVkrwXFtGOnpoJC0C0qAjxP8qcW4I76EkyLHKwMAX5mwEXvyAjpNMBVf8787Ih4rd8X3cUGPLC9XcOCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyqDHvKJiJ8hHRun2p1Ihf9iQaYmA+QVsriop471t31Ay7inuA
	LGyJBf7js6JEVU0DSsxTh8V5RXTRxr/4hLsh752pIlKLtUc9/tGBlOFef0XUYwHVnIc34UIp8GF
	pFsTdB+VYcgxECxgPg11c0RVlOVdoHnA=
X-Gm-Gg: AR+sD13wIsO1z9+7cvAMKK0YTAEQxY+zZ0ensm1ByE1LAc7xNPQyVbqgOtDQe11oxYO
	GnG5MzpCA2eHCKq6RX9nKmBrGzBRPK0jR6ZyGkaVXDPXlay2HYB7mNx7wL4LYDZw5mvTdwNHFrx
	0aO1otdLTRXAMnODkJS1c928RVYM0Dz9KZegzTLV2MakaMBkmUMuLb8wIUGlVkn/C6YePtG/HMy
	P3+6PKQooKixZ7tB+AGzbrWWfu4kEpkIf6Us5+k03ATmpWgRk0Fdqox9guoSPzxYx1iCD1lz+Ar
	h9tMsW1psRKF5hGEDOgqNdrzQMSUKN+10cL0IQX/oX4fal4iX4trTE6X/sqXKxMTzAusQa9geTn
	bssyRBAiOv6zemNg=
X-Received: by 2002:a05:6000:220e:b0:47a:e342:373e with SMTP id
 ffacd0b85a97d-47fafa8d34fmr158129f8f.58.1785175149382; Mon, 27 Jul 2026
 10:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727103449.3188105-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <amd-llbKq1t42NJY@ninjato>
In-Reply-To: <amd-llbKq1t42NJY@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 27 Jul 2026 18:58:42 +0100
X-Gm-Features: AUfX_myESa_MFxqRB0QW75viHOy-SwrQdFWdL-wB5p8gk_xS459_sX-DcTtUq9U
Message-ID: <CA+V-a8vTjYKeGAt+FdRz3qsyyJLZxUFD1MDvSHsJv7=P+FHTfA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] memory: renesas-rpc-if: Optimize transfer overhead
 and implement runtime PM autosuspend
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Mon, Jul 27, 2026 at 4:51=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Prabhakar,
>
> > This patch series optimizes the Renesas RPC-IF driver by significantly
> > reducing software overhead in both the direct memory-mapped (dirmap) an=
d
> > manual transfer paths, maximizing transaction throughput, and introduci=
ng
> > runtime PM autosuspend to prevent aggressive power gating during
> > consecutive flash operations.
>
> Sounds great. I want to test it on R-Car V4H SparrowHawk.
>
Thank you.

> > These changes were benchmarked using flash_speed on the RZ/T2H EVK with
> > xSPI0/1 interfaces operating in 1S-1S-1S mode for write operations:
>
> 'flash_speed' from mtd-utils, I assume. Did you use other options than
> '-d' for testing writes?
>
Apart from the -d option I used `-c 256` option too.

Cheers,
Prabhakar
