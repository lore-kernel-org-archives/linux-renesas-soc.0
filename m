Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7223CF679
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 10:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773225528; cv=none; b=bUmJ3AwYyQ1Zb8PwPWvCdkMQFjdhDNCVBWvVXeSl17/rX7VPpBe2prkj8Nt64WqAwI7fzj8HEiwkP58EKhlXYoD+Hlr4UnZTsxiAe/+mXNnPXWIPfqoKIUn3g02nN+llTC0DcZTiktT06KV7wHD4zEFEcVYKj4uSD6CIkDE4rIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773225528; c=relaxed/simple;
	bh=i7nUMXQbtZArZGnsatx9qQeykbtPVUo/SqQprsinRno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tuMYgWekzNE6esVGzjbyDe2AI1hKzwvLqsl6aVdzS/PUqDNuwOB3nlrR3wfmLqKTHrFEg3yRrQ/RnqC1Lp72WyiDHi5biBsPnyhg4oHYHTStL1Nk+lCsCAwSCTdjuPEKzZGLHI02BGaGixBrUJ+r29Hos+qXi2UpVoIXWYv9dlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8E+qNcz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8E+qNcz"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82989744ee0so5580087b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 03:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773225527; x=1773830327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trxODt72+ZLmM73SSgKB2PrCW34S11oS3WsSFeUrg74=;
        b=J8E+qNczqifmPq/ZFjhO3BYc1oRJN/PB3QhnQEsTSjTWa59nnf3Gyc27YH2UpdA3cd
         Mv0+LI//wgiqAEOLdjLa5V8ncUgKiweo5oQWMHFkaMhfCD3Nsl7g6a419u6bN1U8rJsR
         hnjnmd+m8tabfPNvYR2qj3f4ge2CFBKKieX70VZq/tBZWxLSs+eGNUKCVOs5HPZ7vB1w
         ygmKehbSGLP0jLLRlnUw6AzOpq81DpVAyOLZpC7Yz4xuo01+WNYvZ85bTIqnrIRnE3kb
         Wdk9JbIWB41dUzfA0SkorSZPljMyUwAjyYLxSHt45uIoIMQArNAI3NGVcrlHsqbVggsQ
         HbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773225527; x=1773830327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=trxODt72+ZLmM73SSgKB2PrCW34S11oS3WsSFeUrg74=;
        b=L8jKPu0SDwzZQ+KSUVOqKZHB2z/Wz6PpBvCPHAZumAxkQzIYLNe98p6TBtHdvA9slF
         9tDBHmki2lfFSZBsp+Pt9xrmhNTAfDB+2lfIs/ElZAEVXn+7+HwZ1T+HhfrDJBsCI3hq
         psZwxfj9T33yM3+zbM8l6Z2BN8ke2yTllHHIcabhTgzkgko+ofFTbNphQnkikSB0NhUD
         sg9+Zn4WPmKnkdPpJHgHzLsXHXtsc8luhPXTez7SDIt4cWerW08W4Z0uJQ0tTfR0UoHo
         +LU1ph0kndPGjWTyqFIRKqCC5dZnTjfWE+9CC64PHcfT6TXaMmlYrqHnMLFEIyTohn8J
         iSSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzqLskK5bU5+AIIoNBJefEH+1UFR7xshIsmiaCZlHGHBkzQHllGWrazj8FuC4AmfXuQZFTYnkqXZ5vUbLD05+lkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN74fy7nFbbs4C3sHhloHWthmkyiLXkwCey4hLbB7H9BPVzp5P
	dTQWPoDjAK5zyLxoiNzoB01cujmlu+RZTG5j0KuosOxmQhxIvolmsb+j
X-Gm-Gg: ATEYQzwRTNWMnpbEgl3VlXnQ8ZiUfQFD3iKXkS8iX2mX89lHBh2F0J0r0ZHjbF55Nap
	HRqYEBYey+2ZTjW25hcjYCEeH9sYFnmZzBr0cjaSZSx2mQ15M5Scx65p2K6RjSKLK8R6s9lu2IF
	V+EsH85RCLTmijeGw/e5Vilh+9BkSh5xDw1RRp+iG1Q1vtEIzoPQoAxic5EO7jeJ0a3ID88dfzL
	t39Yc/jcK8aQoDzblz+lqTi7pE8A0kL8h/kabQT1UuNIXKDN3QvNNamOHDFmLy9pz/CrUoDYlja
	e+ku2a4F8rcNIkmrRcurqCzNGwKf3NdaHwxUup0gB60bLemFeEc4MAjDS1wH6mXiJ6C3Fo+J/zC
	Bl+u5GVYDjTiju95stMvwCbtZ98dbbJuUP75PdynY48vHhHnSEtxpH0Ot4vdIry1Ot+G/7jao9w
	VSUkqbPtUnFnz2nC8wpcdzYLSpIFsXY/Qqi+/Xf3m5ryG+NzJABf+WCfOq5Ab5HqNC2lrfE016n
	dBkFA==
X-Received: by 2002:a05:6a00:189d:b0:81f:38f4:d774 with SMTP id d2e1a72fcca58-829f6ee156dmr2271399b3a.27.1773225526679;
        Wed, 11 Mar 2026 03:38:46 -0700 (PDT)
Received: from localhost.localdomain ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6f1e374sm1785635b3a.44.2026.03.11.03.38.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Mar 2026 03:38:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: wsa+renesas@sang-engineering.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	geert+renesas@glider.be,
	hechtb@gmail.com,
	javier.carrasco@wolfvision.net,
	jeff@labundy.com,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	phucduc.bui@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH v4 0/2] Input: st1232 - add system wakeup support
Date: Wed, 11 Mar 2026 17:38:38 +0700
Message-Id: <20260311103838.5541-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <abCkulmW8XDXkXiT@shikoro>
References: <abCkulmW8XDXkXiT@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

> > Demo video showing wakeup from suspend:
> > https://youtu.be/POJhbguiA7A
> 
> Nice video! You really put some effort here, kudos.
> 
> Really awesome seeing Linux 7 on this old platform :)
> 
> Happy hacking,

Thanks for the kind words and encouragement.
I'll keep learning from the feedback here and 
continue hacking on it.

Best regards,
Phuc
