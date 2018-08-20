Return-Path: <u-boot-bounces@lists.denx.de>
From: Marek Vasut <marek.vasut@gmail.com>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Igor Opaniuk <igor.opaniuk@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Chris Packham <judge.packham@gmail.com>,
 Alex Kiernan <alex.kiernan@gmail.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Michal Simek <michal.simek@xilinx.com>, York Sun <york.sun@nxp.com>,
 "Derald D . Woods" <woods.technical@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Baruch Siach <baruch@tkos.co.il>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Stephen Warren <swarren@nvidia.com>, Alexander Graf <agraf@suse.de>,
 Rick Chen <rick@andestech.com>, Adam Ford <aford173@gmail.com>,
 Simon Goldschmidt <sgoldschmidt@de.pepperl-fuchs.com>,
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Takeshi Kihara <takeshi.kihara.df@renesas.com>, Bin Meng
 <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Anatolij Gustschin <agust@denx.de>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Peng Fan <peng.fan@nxp.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Mario Six <mario.six@gdsys.cc>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Stefan Roese <sr@denx.de>,
 Zubair Lutfullah Kakakhel <zubair@resin.io>,
 Quentin Schulz <quentin.schulz@bootlin.com>
References: <20180820000033.25519-1-erosca@de.adit-jv.com>
 <20180820000033.25519-5-erosca@de.adit-jv.com>
Message-ID: <a2ccb9b2-0a8e-29ef-269a-3c110752a7c6@gmail.com>
Date: Mon, 20 Aug 2018 10:07:16 +0200
MIME-Version: 1.0
In-Reply-To: <20180820000033.25519-5-erosca@de.adit-jv.com>
Content-Language: en-US
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, u-boot@lists.denx.de,
 Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [U-Boot] [PATCH 4/8] pinctrl: renesas: Fix "left shift in type
 int" undefined behavior
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
List-ID: <linux-renesas-soc.vger.kernel.org>

T24gMDgvMjAvMjAxOCAwMjowMCBBTSwgRXVnZW5pdSBSb3NjYSB3cm90ZToKPiBCb290aW5nIFIt
Q2FyIEgzLVNhbHZhdG9yLVggKENPTkZJR19VQlNBTj15KSBjb25zaXN0ZW50bHkgcmVzdWx0cyBp
bjoKPiAKPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KPiBVQlNBTjogVW5kZWZpbmVkIGJlaGF2aW91ciBpbiBkcml2
ZXJzL3BpbmN0cmwvcmVuZXNhcy9wZmMuYzo0MDI6NDAKPiBsZWZ0IHNoaWZ0IG9mIDEgYnkgMzEg
cGxhY2VzIGNhbm5vdCBiZSByZXByZXNlbnRlZCBpbiB0eXBlICdpbnQnCj4gPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
Cj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09Cj4gVUJTQU46IFVuZGVmaW5lZCBiZWhhdmlvdXIgaW4gZHJpdmVycy9w
aW5jdHJsL3JlbmVzYXMvcGZjLmM6NDEwOjM5Cj4gbGVmdCBzaGlmdCBvZiAxIGJ5IDMxIHBsYWNl
cyBjYW5ub3QgYmUgcmVwcmVzZW50ZWQgaW4gdHlwZSAnaW50Jwo+ID09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IAo+
IFdoaWxlIGZpeGluZyB0aGVzZSB3YXJuaW5ncywgY29udmVydCAqYWxsKiBTSF9QRkNfUElOX0NG
R18qIGRlZmluaXRpb25zCj4gdG8gdXNlIHRoZSByZWNvbW1lbmRlZCBCSVQoKSBtYWNyby4KPiAK
PiBGaXhlczogOTEwZGY0ZDA3ZTM3ICgicGluY3RybDogcm1vYmlsZTogQWRkIFJlbmVzYXMgUkNh
ciBwaW5jb250cm9sIGRyaXZlciIpCj4gU2lnbmVkLW9mZi1ieTogRXVnZW5pdSBSb3NjYSA8ZXJv
c2NhQGRlLmFkaXQtanYuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9zaF9w
ZmMuaCB8IDE0ICsrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9yZW5l
c2FzL3NoX3BmYy5oIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvc2hfcGZjLmgKPiBpbmRleCBi
OThjMmYxODVkMjYuLmI1OGU1MmJiZmJiOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwv
cmVuZXNhcy9zaF9wZmMuaAo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3NoX3BmYy5o
Cj4gQEAgLTIxLDEzICsyMSwxMyBAQCBlbnVtIHsKPiAgCVBJTk1VWF9UWVBFX0lOUFVULAo+ICB9
Owo+ICAKPiAtI2RlZmluZSBTSF9QRkNfUElOX0NGR19JTlBVVAkJKDEgPDwgMCkKPiAtI2RlZmlu
ZSBTSF9QRkNfUElOX0NGR19PVVRQVVQJCSgxIDw8IDEpCj4gLSNkZWZpbmUgU0hfUEZDX1BJTl9D
RkdfUFVMTF9VUAkJKDEgPDwgMikKPiAtI2RlZmluZSBTSF9QRkNfUElOX0NGR19QVUxMX0RPV04J
KDEgPDwgMykKPiAtI2RlZmluZSBTSF9QRkNfUElOX0NGR19JT19WT0xUQUdFCSgxIDw8IDQpCj4g
LSNkZWZpbmUgU0hfUEZDX1BJTl9DRkdfRFJJVkVfU1RSRU5HVEgJKDEgPDwgNSkKPiAtI2RlZmlu
ZSBTSF9QRkNfUElOX0NGR19OT19HUElPCQkoMSA8PCAzMSkKPiArI2RlZmluZSBTSF9QRkNfUElO
X0NGR19JTlBVVAkJQklUKDApCj4gKyNkZWZpbmUgU0hfUEZDX1BJTl9DRkdfT1VUUFVUCQlCSVQo
MSkKPiArI2RlZmluZSBTSF9QRkNfUElOX0NGR19QVUxMX1VQCQlCSVQoMikKPiArI2RlZmluZSBT
SF9QRkNfUElOX0NGR19QVUxMX0RPV04JQklUKDMpCj4gKyNkZWZpbmUgU0hfUEZDX1BJTl9DRkdf
SU9fVk9MVEFHRQlCSVQoNCkKPiArI2RlZmluZSBTSF9QRkNfUElOX0NGR19EUklWRV9TVFJFTkdU
SAlCSVQoNSkKPiArI2RlZmluZSBTSF9QRkNfUElOX0NGR19OT19HUElPCQlCSVQoMzEpCgpNaWdo
dCBtYWtlIHNlbnNlIHRvIGFwcGx5IHRoZSBzYW1lIGZpeCBmb3IgTGludXggPwoKQWNrZWQtYnk6
IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBnbWFpbC5jb20+CgotLSAKQmVzdCByZWdhcmRzLApN
YXJlayBWYXN1dApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpVLUJvb3QgbWFpbGluZyBsaXN0ClUtQm9vdEBsaXN0cy5kZW54LmRlCmh0dHBzOi8vbGlzdHMu
ZGVueC5kZS9saXN0aW5mby91LWJvb3QK
