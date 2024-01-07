VERSION:=$(shell date +"%y.%-m.%-d-%-H.%-M")

.SILENT:

build_esbuild_es2021: clean
	pnpm build:esbuild:es2021

build_esbuild_es2021_bundle: clean
	pnpm build:esbuild:es2021:bundle

build_tsc_default_es2021: clean
	pnpm build:tsc:default:es2021

clean:
	pnpm clean

exec_iterator1:
	pnpm exec:iterator1

publish_public:
	pnpm publish --access public

test_ava_all:
	pnpm test:ava:all

update_version:
	jq ".version = \"$(VERSION)\"" package.json > package.json.new
	mv package.json.new package.json
