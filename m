Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416292;
	b=oDm118RDFeVLoxcUIfOMgZd6PGr/Y8Wb75qm7owFknC4LCFyehHV668//o97AuDJRlI/
	 jF3q2VQxBdZJMHB5LW5WduqfY0CxDa5nLvDZ24zYravxTLxj1U4QQ6CbvbNbk5+vPbUEe
	 jy3PeIzpeKkakv5rGaxVGh5BfO+zXcE3tpoDYAGNVvkkDEYSqUBoL6aRkrXWaA7DFl2PJ
	 aP/GXYbqLFUcCbUp2nJ4balcP9Lp0AzhCQsbhPpbJQOzOxqZ2biXdhQCRT/X4eTJDYFMw
	 HYsJ7Z+JjvYBGBWEo2BdBZhtDExKYdVwI9E/qdjyuhCNc9vMfoUgHxCwhnx3xaPinww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=2SjRi5DA6EPs4N724PY/ZYwEORsvpZ9R0IBDl0iZ0NE=;
	b=dAFkI8cFOqUDQFt0oUFtvZMR3cwCZqoL5XxuGhTxzEj3EUtjnZc3MkChspxqNbgGo1fV
	 gLubTFYHVi7VS0bj0NXZdn7NqtxBY++zsUPnDW22w7XNKzvOSTyCU+KqbBqGedymJG2z/
	 Xz3A7cnbxMmJQ1siw/aV2Q24ov0btD6WyVhJdim4dlLJISSOKvlwCDcNZHZ4GlhnJKVCh
	 DHMGOybLBinjPQsp5943MZei2ElSA1ArCYvwHqJjuJggUmVR76fMfgyxfSGbc1/kgkCSD
	 N+9dcdpSslZc4Yqinh6cNvjZffTZwu+HKsPQgTnzlsHcz8lMmxffDU7GqCpmpiQOVwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4o2xYsG;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B41606A321
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 06:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2B41606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j4o2xYsG
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso1854410a91.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Nov 2026 22:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416291; x=1796021091; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2SjRi5DA6EPs4N724PY/ZYwEORsvpZ9R0IBDl0iZ0NE=;
        b=j4o2xYsGh3WF/JUZQQOuj/v67/PWJ7hBi2FsjvLLsZtbm29aHoYdH0NO+RcHpADiGL
         2dvXRLuk5oNLY5e3J5y6E54Umcm0YyNsO+tBVTYSYc8Xa+Jk/uS8g20d6XOSmM85q7Mv
         OOvTfnX7Egw7qPncqmwIy1jdpRDl0/Prkna0hyc/JYVrKiNwRkwjCwV3C6XJAL+vV7E7
         rmefry0U/PqpRQnG2xXtfNfXYUkv1b7CidqpNSjO077yuGBXMab68jiF244vxAbttmAO
         b74JQzwV1UZI8H2QsIDxvyqmNgfBnWyrqPslKLrBAFY8wGlBVH7Oxyb80w9pFsfby4Ex
         UGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416291; x=1796021091;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2SjRi5DA6EPs4N724PY/ZYwEORsvpZ9R0IBDl0iZ0NE=;
        b=alQ4OxSVlNOEZrBeSjZVrc5Sznr/WAPv6Ib3kefyGlAFga6mVNv2j2IEmqOguGjs9a
         MqVyks/srLFisf6SQSZUA3jF6eghWbr7ofAAyTI/LKrkNbqOgAoyaCcFBUhSWZs+wsYZ
         deEcGH81fH6cralvOzESV9SzZR848AhNtusfFINjJwanJaoX8xMWuZE7Lf0zMkUqzSxp
         rA6bjoO2N+VscJHR8uZ/v3yVzmRrYhpPxnHS3qK+XtwK0gAjFLlRBP9GNfpnoGG7ywkh
         SV9v65Tey0pwWv6UJYNM75cZDon0iMiELHBH5oPi/c+vvlCxMZH6KebZJyFmPIUeJHXl
         DNlQ==
X-Forwarded-Encrypted: i=1; AL+hErGzlxIK0mUHdzYacxxDsPIrmyzpjAq0vselIJIVbiiz6XcChXrdt45mt5QQIXAUIqrCYJMDRmleElfuEfxgakxeWQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8KRx8ecN2t5oGMMfA9xiFeSZ76BkQMrE5Fbg4QYW9uwAep9eY1
	9geqmRvi4+3SXoE/LvSiHTjxpgQzH5SJXm0+nZFhUGAxrmYamOTfo1NE
X-Gm-Gg: AZFdTZdjLRN/EHt4LorbNMOgCSP2yP1Nh7Faoqr4lx40lEA6uNHe1n9u28bVPZ7NHFT
	lND9AVwifLxaWOCoXNHLVe70+ZGOpAji7Rmp3qa++qZmZSXkph683AmN3ry+WCvCvh5GRsGhaRe
	b7+oLnrnNanG9rqHyc0Nz+MGOiIfcmqq6LCaf1YnwVNKlC1t38t68vysV0zuqmsDqL/o+5CmuAq
	YJRUCOvvPloL/9244Nnj1aPLxtLbHIrHKXKITUAQ565rG+dZ9fyIeBnS5X4Pdq/UVwjkxZSU+ie
	3GRiCWMRzJlQTkJSfoGCg/N8/Pwx7lDGroy2iV3HzvF0/thNAfS1ratg7RId6W3Bq76aqSxUtpq
	VQspxh4tUh6Hol1J9sk2Mk7170cO4bzk1bvBSefldrWC218F95eZSMDM3b7aKwkrEuBILl/HWim
	2O3xUSeYdFpqHVaP3a/cjneuVyaAO9gqjF9wbL54mwdqZZETIP3Yi3fwNZZtFy9rpoqReT3j5hq
	pYVNNWONwQl4W4vZ0oHYosROR8kr9r8ZCktkb8w+qIL1ABvPFKt9yx0V0d4aLaJDreHKsd/yNHr
	jD6I+N7budbZV7UjDoh6opCPrUCDXco9V2RRg8z1F52c/LEk/f6pMRW80EyVNcoZPTYM5w==
X-Received: by 2002:a17:90b:224e:b0:3b4:f92:ade8 with SMTP id 98e67ed59e1d1-3b41c7e1174mr10446536a91.7.1795416291007;
        Sun, 22 Nov 2026 22:44:51 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm17835023a91.5.2026.11.22.22.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:44:50 -0800 (PST)
Date: Sun, 22 Nov 2026 22:44:49 -0800
Message-ID: <dea00f90c205f8359baca729d8b0f31a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Rich Felker <dalias@libc.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-sh@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] sh: mach-rsk: rsk7203: switch to using static device property, drop legacy gpio API
In-Reply-To: <arzKNhmoL6yiGrzH@ashevche-desk.local>
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com> <3a51385d-9649-4bd7-87b3-0caf9e462b2e@app.fastmail.com> <arzKNhmoL6yiGrzH@ashevche-desk.local>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Adrian,

On Wed, Sep 30, 2026 at 11:37:10AM +0300, Andy Shevchenko wrote:
> On Wed, Sep 30, 2026 at 09:23:21AM +0200, Arnd Bergmann wrote:
...
> > The patches look good to me. I have build-tested this with the snippet
> > below and my series from
> > https://lore.kernel.org/all/20260907090956.2825703-2-arnd@kernel.org/
> > to check that no use of the legacy interfaces remain.
> > You can probably fold my one-liner into your last patch.
...
> > I would guess even with access to hardware testing is going to be
> > challenging, I noticed that the defconfig kernel does not fit on the
> > 4MB flash any more (even without rootfs), and the USB support was
> > never added for rsk7203, only for 7264/7269.
>
> ...which induces a practical question, shouldn't we just drop the whole thing
> for good?

Gentle ping on this series. Will you be applying these patches (possibly
with Arnd's Kconfig tweak folded in), or would you prefer patches
removing rsk7203 support altogether since it is not working anyway?

Thanks.

-- 
Dmitry
